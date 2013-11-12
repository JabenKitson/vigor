class Vegresource < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy
  has_many :attachments, :dependent => :destroy
  has_many :vrhighlights, :dependent => :destroy
  #has_many :vraas, :dependent => :destroy
  #has_many :vrattributes, :through => :vraas
  has_and_belongs_to_many :vrattributes
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  accepts_nested_attributes_for :reviews, :allow_destroy => true
  accepts_nested_attributes_for :vrhighlights, :allow_destroy => true
  belongs_to :user #user that submitted the resource
  attr_accessible :vrtype ,:name, :website, :author, :info, :address, :vrattributes, :vrhighlights_attributes, :vrattribute_ids, :attachments_attributes, :reviews_attributes

  def rating
    reviews.select("avg(rating) as average").first.average.to_i
  end
  
end
