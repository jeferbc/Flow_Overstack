class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :update, :detroy]

  def index
    @questions = Question.all
  end

  def show
    @answers = @question.answers
    @comment = Comment.new
    @comments = @question.comments
    @vote = Vote.new
    @votes = @question.votes.count
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
      if @question.save
        redirect_to question_path(id: @question.id)
      else

      end

  end
  def update
      if @question.update(question_params)
        redirect_to question_path
      else

      end
  end


  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :content)
    end
end
