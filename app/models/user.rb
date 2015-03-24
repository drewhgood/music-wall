class User < ActiveRecord::Base
  has_many :songs
  has_many :ratings

  validates :email, presence: true, uniqueness: true
  validates :name_first, presence: true
  validates :name_last, presence: true
  validates :password, presence: true, length: { in: 7..20 }
end