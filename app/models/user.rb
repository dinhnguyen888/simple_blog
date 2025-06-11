class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :role, presence: true, inclusion: { in: %w[user admin] }
  
  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end
end
