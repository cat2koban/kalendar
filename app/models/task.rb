class Task < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, length: { maximum: 255 }
  validates :start_at, presence: true
  validates :finish_at, presence: true
end
