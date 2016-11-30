class VotesController < ApplicationController


  # POST /comments
  # POST /comments.json
  def create
    @vote = Vote.new(vote_params)
    if @vote.save
    else
    end
    redirect_to question_path(id: params[:question_id])
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
      if @vote.update(vote_params)

      else

      end
      redirect_to question_path(id: params[:question_id])
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @vote.destroy
    redirect_to question_path(id: params[:question_id])

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def vote_comment
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:amount, :votable_id, :votable_type, :user_id)
    end
end
