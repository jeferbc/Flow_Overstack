class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update, :detroy]
  before_action :set_question, except: [:index, :new, :create]
  before_action :set_ransack

  def index
    if params[:q].present?
      @questions = @search.result
    else
      @questions = Question.all
    end
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to question_path(id: @question.id)
    else
      flash[:alert] = "The Question hasn't been created, due an error"
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to question_path
    else
      flash[:alert] = "The Question hasn't been edited, due an error"
    end
  end


  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def track_view
    @question.update(viewed: @question.viewed + 1)
    redirect_to question_path(@question)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end
    def set_ransack
      @search = Question.search(params[:q])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :content)
    end
end
