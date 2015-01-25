class Post < ActiveRecord::Base
    attr_accessible :content, :user_id, :avatar, :tag_list
    belongs_to :user
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "avatar/missing.jpg"
    has_many :comments
	searchkick
	acts_as_taggable
    include PublicActivity::Model
	
    tracked owner: ->(controller, model) { controller && controller.current_user }
    acts_as_likeable
end
