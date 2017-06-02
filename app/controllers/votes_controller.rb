class VotesController < ApplicationController

  def create
    @vote = @votable.votes.new(vote_params)
    @vote.user = current_user
    @vote.save
    @votes = @vote.calculate_votes(@votable)
  end

  def destroy
    @vote = Vote.find(params[:id])
    @votes = @vote.calculate_votes(@votable)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.permit(:liked)
    end

end
