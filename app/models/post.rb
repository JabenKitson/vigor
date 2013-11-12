class Post < ActiveRecord::Base
   validates_presence_of :title
   has_many :comments 
   has_many :attachments, :dependent => :destroy
   accepts_nested_attributes_for :attachments, :allow_destroy => true
   belongs_to :user, :foreign_key => :author_id
   
end
