class Task < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, length: { maximum: 140 }
end
