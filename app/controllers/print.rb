# frozen_string_literal: true

class Print < ApplicationController
  def self.to_file(obj)
    File.write(File.join('tmp', 'logs', "#{Time.zone.now.to_s[0, 19]}.rb"), obj)
  end

  def self.ppp(obj)
    Rails.logger.debug '*' * 50
    Rails.logger.debug obj
    Rails.logger.debug '*' * 50
  end
end
