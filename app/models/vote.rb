# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  amount       :boolean
#  votable_type :string
#  votable_id   :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true
  belongs_to :user

  def self.already_vote?(user_id, id, method)
    if method == "Question"
      votes = Question.find(id).votes
    else
      votes = Answer.find(id).votes
    end
    if votes.find_by(user_id: user_id) == nil
      false
    else
      true
    end
  end
  def self.destroy_vote?(user_id, id, method)
    if method == "Question"
      votes = Question.find(id).votes
    else
      votes = Answer.find(id).votes
    end
    votes.find_by(user_id: user_id).destroy 
  end


end
