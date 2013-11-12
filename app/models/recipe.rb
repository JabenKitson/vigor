class Recipe < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews
  has_many :attachments, :dependent => :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  accepts_nested_attributes_for :reviews, :allow_destroy => true
  attr_accessible :name, :attachments_attributes, :reviews_attributes, :category_id, :description, :ingredients, :instructions

   
   def rating
    reviews.select("avg(rating) as average").first.average.to_i
   end
  
   def self.featured
     Recipe.joins(:attachments).order("recipes.created_at DESC").first
   end
   
   def self.newest(quantity)
     Recipe.includes(:attachments).order("recipes.created_at DESC").limit(quantity) unless Recipe.includes(:attachments).blank?
   end
   
   def self.find_by_potluck(month,year)
     Recipe.where(create_at.month == month && create_at.year == year)
   end
   
   def self.find_by_rating(stars)
     Recipe.where(rating == stars)
   end
   
   
end
