class Answers::CommentsController < CommentsController
  before_action :set_commentable

  private
    def set_commentable
      @commentable = Answer.find(params[:film_id])
    end
end
