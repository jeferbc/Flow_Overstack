# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  content     :text
#  code        :text
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :question
  has_many :comments, as: :commentable
end
