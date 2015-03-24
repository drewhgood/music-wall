require 'uri'

class Song < ActiveRecord::Base
  belongs_to :user
  has_many :ratings

  validates :title, presence: { message: "Please enter a title." }
  validates :author, presence: { message: "Please enter a author." }
  validates :url, presence: { message: "Please enter a url." }
  validates_format_of :url, :with => URI::regexp(%w(http https))
end