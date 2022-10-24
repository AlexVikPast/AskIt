class Admin::UsersController < ApplicationController
  before_action :require_authentication, only: %i[edit update]

  def index
    respond_to do |format|
      format.html do
        @users = User.order(created_at: :desc)
      end

      format.zip do
        respond_with_zipped_users
      end
    end
  end

  def create
    if params[:archive].present?
      UserBulkService.call params[:archive]
      flash[:succes] = "Users imported!"
    end

    redirect_to admin_users_path
  end

  private
  def respond_with_zipped_users
    compressed_filestream = Zip::OutputStream.write_buffer do |zos|
      User.order(created_at: :desc).each do |user|
        zos.put_next_entry "user_#{user.id}.xlsx"
        zos.print render_to_string(
          layout: false, handlers: [:axlsx], formats: [:xlsx],
          template: 'admin/users/user',
          locals: { user: user }
        )
      end
    end

    compressed_filestream.rewind
    send_data compressed_filestream.read, filename: 'users.zip'
  end
end