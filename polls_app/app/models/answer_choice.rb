# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          not null
#  text        :string           not null
#

class AnswerChoice < ApplicationRecord
  validates :question_id, :text, presence: true

  has_many :responses,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :Response

  belongs_to :question,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :Question
end
