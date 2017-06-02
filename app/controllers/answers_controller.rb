class AnswersController < ApplicationController
  before_action :set_answer, except: [:create]
  before_action :set_question, only: [:create, :edit]

  def edit
  end

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user
    @answer.save
  end

  def update
    @answer.update(answer_params)
  end

  def destroy
    @answer.destroy
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
      params.require(:answer).permit(:content)
    end
end
