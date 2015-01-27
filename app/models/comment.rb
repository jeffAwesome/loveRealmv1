class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :post
    belongs_to :story
    attr_accessible :content, :post_id, :story_id
    acts_as_likeable
    include PublicActivity::Model
    tracked owner: ->(controller, model) { controller && controller.current_user }
end
