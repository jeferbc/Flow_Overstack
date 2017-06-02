class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :destroy, :update]

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    render 'comments/create.js'
  end

  def edit
    if @commentable.kind_of?(Question)
      @path = [@commentable, @comment]
    else
      @path = [@commentable.question, @commentable, @comment]
    end
  end

  def update
    @comment.update(comment_params)
    render 'comments/update.js'
  end

  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
