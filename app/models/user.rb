class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:facebook]

    # Setup accessible (or protected) attributes for your model
    attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :avatar
    validates :name, presence: true
    # attr_accessible :title, :body
    acts_as_followable
    acts_as_follower
    has_many :posts
    has_many :stories
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "default-avatar.png"
    has_many :comments
    acts_as_liker
    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    end
end
