class Story < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :avatar, :tag_list
  belongs_to :user
  has_attached_file :avatar, :styles => { :medium => "300>", :thumb => "100x100>" }, :default_url => "avatar/missing.jpg"
  has_many :comments
  acts_as_taggable
  acts_as_likeable
  searchkick
end
