class Group < ApplicationRecord
  has_many :member
  validates :name, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 255 }
end
