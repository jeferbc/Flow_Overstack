class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Your comment was successfuly posted."
    else
      flash[:alert] = "The comment hasn't been created, due a system error"
    end
    render 'questions/create.js'
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "Your comment was successfuly edited."
    else
      flash[:alert] = "The comment hasn't been edited, due a system error"
    end
    redirect_to question_path(id: params[:question_id])
  end

  def destroy
    @comment.destroy
    redirect_to question_path(id: params[:question_id])
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
