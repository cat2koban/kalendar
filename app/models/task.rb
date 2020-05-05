class Task < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, length: { maximum: 255 }
end
