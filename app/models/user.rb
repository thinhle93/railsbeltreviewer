class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :attends
  has_many :events_attend, through: :attends, source: :event

  email_regex = /\A([\w+-].?)+@[a-z\d-]+(.[a-z]+)*.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: email_regex }
  validates :city, :state, :first_name, :last_name, presence:true
  validates :first_name, :last_name, length:{minimum:2, message:"must be at least 2 characters"}
  validate :password_length

  private

  def password_length
    errors.add(:password, "is too short yo!") if password.length < 5
  end


 # validates :last_name,length:{minimum:2, message:"must be at least 2 characters"}
 #validates :password, confirmation: true
end
