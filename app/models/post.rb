class Post < ActiveRecord::Base
  has_many :comments, :order => "created_at DESC", :dependent => :destroy 
  accepts_nested_attributes_for :comments
end
