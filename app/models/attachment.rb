class Attachment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :recipe
  belongs_to :vegresource
  belongs_to :post
  belongs_to :review
  belongs_to :vrhighlight
  has_attached_file :photo, :styles => { :thumb => "75X75", :small => "150x150#", :medium => "600X600", :large => "1600X800#" },
                  :url  => "/assets/attachments/:id/:style/:basename.:extension",
                  :path => ":rails_root/app/assets/images/attachments/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
