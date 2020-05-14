class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :members
  has_many :groups, through: :members

  before_save :downcase_email

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def joined_group_members
    user_ids = Member.where(group_id: group_ids).distinct.pluck(:user_id)
    User.where(id: user_ids).where.not(id: id)
  end

  private

  def downcase_email
    email.downcase!
  end
end
