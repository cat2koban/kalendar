class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  before_save :downcase_email

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  private

  def joined_group_members
    group_ids = Member.where(user_id: id).pluck(:group_id)

    user_ids = []
    group_ids.each do |group_id|
      user_ids.push(*Member.where(group_id: group_id).pluck(:user_id))
    end

    members = []
    user_ids.uniq.reject { |i| i == id }.each do |user_id|
      members.push(User.find_by(id: user_id))
    end

    members # [User, User, User...]
  end

  def downcase_email
    email.downcase!
  end
end
