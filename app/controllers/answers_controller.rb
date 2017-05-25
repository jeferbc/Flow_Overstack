class AnswersController < ApplicationController
  before_action :set_answer, except: [:new, :create]
  before_action :set_question, only: [:new, :edit]

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = "The answer has been created successfuly"
    else
      flash[:alert] = "The answer hasn't been created, due a system error"
    end
    redirect_to question_path(id: params[:answer][:question_id])
  end

  def update
    if @answer.update(answer_params)
      flash[:notice] = "The answer has been updated successfuly"
    else
      flash[:alert] = "The answer hasn't been edited, due a system error"
    end
    redirect_to question_path(id: params[:answer][:question_id])
  end

  def destroy
    @answer.destroy
    redirect_to question_path(id: params[:question_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:content, :question_id, :id, :user_id)
    end
end
