class Vrhighlight < ActiveRecord::Base
  belongs_to :vegresource
  belongs_to :user
  has_many :attachments, :dependent => :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true
end
