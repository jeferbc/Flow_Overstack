class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers/new
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  # GET /answers/1/edit
  def edit
    @question = Question.find(params[:question_id])
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
    else
      flash[:alert] = "The answer hasn't been created, due a system error"
    end
    redirect_to question_path(id: params[:answer][:question_id])
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    if @answer.update(answer_params)
    else
      flash[:alert] = "The answer hasn't been edited, due a system error"
    end
    redirect_to question_path(id: params[:answer][:question_id])
  end
  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    redirect_to question_path(id: params[:question_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:content, :question_id, :id, :user_id)
    end
end
