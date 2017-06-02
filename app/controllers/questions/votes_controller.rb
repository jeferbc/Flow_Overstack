class Questions::VotesController < VotesController
  before_action :set_votable

  private
    def set_votable
      @votable = Question.find(params[:question_id])
    end
end
