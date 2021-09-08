class Task < ApplicationRecord
  STATUS = ["未対応","対応中","完了"]

  validates :title,  presence: true
  validates :deadline,  presence: true
  validates :status,  presence: true

  belongs_to :user
end
