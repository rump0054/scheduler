class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :schedules

  validates :first_name, presence: true
  validates :last_name, presence: true
end