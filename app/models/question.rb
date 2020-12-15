class Question < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :answers
  has_one :chosen_answer, -> { where(chosen: true) }, class_name: 'Answer'

  accepts_nested_attributes_for :answers, update_only: true

  validates :title, :body, presence: true
  validates_associated :user
end
