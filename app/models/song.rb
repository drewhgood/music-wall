require 'uri'

class Song < ActiveRecord::Base
  belongs_to :user
  has_many :ratings

  validates :title, presence: true
  validates :author, presence: true
  validates :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
end