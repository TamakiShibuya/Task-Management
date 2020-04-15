class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  before_destroy :least_admin_user

  has_many :tasks, dependent: :destroy

  private

  def least_admin_user
    if self.admin?
      throw :abort if User.where(admin: true).count < 2
    end
  end
end
