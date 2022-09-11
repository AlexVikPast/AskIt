class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show destroy edit update]
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new questions_params
    if @question.save
      flash[:success] = "Question create"
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update questions_params
      flash[:success] = "Question update"
      redirect_to questions_path
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "Question destroy"
    redirect_to questions_path
  end

  def show
    @answer = @question.answers.build
  end

  private
  def questions_params
    params.require(:question).permit(:title, :body)
  end

  def set_question
    @question = Question.find params[:id]
  end
end