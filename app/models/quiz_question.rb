class QuizQuestion < ApplicationRecord
    has_many :quiz_answers, dependent: :destroy
    accepts_nested_attributes_for :quiz_answers, reject_if: ->(attributes){ attributes['answer'].blank? || attributes['is_correct'].blank?}, allow_destroy: true
end
