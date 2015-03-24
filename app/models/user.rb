class User < ActiveRecord::Base
  has_many :songs
  has_many :ratings

  validates :email, presence: { message: "Please enter a email address." }
  validates :email, uniqueness: { message: "This email address is already in use." }

  validates :name_first, presence: { message: "Please enter your first name." }
  validates :name_last, presence: { message: "Please enter your last name." }
  validates :password, presence:  { message: "Please enter a password." }
  validates :password, length: { in: 7..20 }
end