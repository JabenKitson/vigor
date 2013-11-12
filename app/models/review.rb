class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :vegresource
  belongs_to :event
  belongs_to :recipe
  has_many :attachments, :dependent => :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  attr_accessible :title, :rating, :average, :attachments_attributes, :body
   
end
