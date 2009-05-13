class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  validates_presence_of     :email, :body
	validates_format_of       :email, :with => /(^([^@\s]+)@((?:[-_a-z0-9]+\.)+[a-z]{2,})$)|(^$)/i
end
