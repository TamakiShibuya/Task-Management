class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :tasks, dependent: :destroy
  
  def least_admin_user
    if self.admin?
        throw :abort if User.where(admin: true).count < 2
    end
  end
end
