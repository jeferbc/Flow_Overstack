# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  amount       :boolean
#  votable_type :string
#  votable_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true

end
