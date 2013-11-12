class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :photo
  has_many :posts, :foreign_key => 'author_id'
  has_many :reviews
  has_many :recipes
  has_many :vegresources
  has_many :events
  has_many :attachments, :dependent => :destroy
  has_attached_file :photo, :styles => { :thumb => "75X75", :medium => "350X350" },
                  :url  => "/assets/profilephotos/:id/:style/:basename.:extension",
                  :path => ":rails_root/app/assets/images/profilephotos/:id/:style/:basename.:extension"

validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
