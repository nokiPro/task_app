class Task < ApplicationRecord
  validates :title,  presence: true
  validates :deadline,  presence: true
  validates :status,  presence: true

  belongs_to :user
end
