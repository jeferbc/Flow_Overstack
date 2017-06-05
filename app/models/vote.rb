# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  liked        :boolean
#  votable_type :string
#  votable_id   :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true
  belongs_to :user

  scope :votes_up, -> { where(liked: true) }
  scope :votes_down, -> { where(liked: false) }

  def calculate_votes(votable)
    votable.votes.votes_up.count - votable.votes.votes_down.count
  end

  def self.already_vote?(user, votable)
    votable.votes.find_by(user_id: user.id)
  end
end
