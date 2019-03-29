# == Schema Information
#
# Table name: responses
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  respondent  :integer          not null
#  question_id :integer          not null
#

class Response < ApplicationRecord
  validates :respondent, :question_id, presence: true

  belongs_to :users,
    primary_key: :id,
    foreign_key: :respondent,
    class_name: :User

  belongs_to :questions,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question

  has_one :question, through: :answer_choices, source: :question

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice
  

  def not_duplicate_response
    siblings = sibling_responses
    raise "Can't have duplicate responses to question" if siblings.any?{|sibling| sibling.respondent == respondent}
  end

  def sibling_responses
    Response.where(question = :question).where.not(id: self.id)
  end
    
end
