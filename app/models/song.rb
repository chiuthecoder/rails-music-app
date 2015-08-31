class Song < ActiveRecord::Base
  belongs_to :user
	has_many :likes
	has_many :liking_users, :through => :likes, :source => :user #who liked it
	validates :artist, :content, :presence => true, :length => { :minimum => 2 }
end
