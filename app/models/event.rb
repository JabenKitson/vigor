class Event < ActiveRecord::Base
   has_many :attachments, :dependent => :destroy
   belongs_to :user
   has_many :reviews, :dependent => :destroy
   accepts_nested_attributes_for :attachments, :allow_destroy => true
   accepts_nested_attributes_for :reviews, :allow_destroy => true
   
   def self.upcoming(quantity,calendardate)
     Event.where("edate > ?", calendardate).order("edate ASC").limit(quantity)
   end
     
   def self.latest_reviews(quantity)
     Event.includes(:reviews => :attachments).order("events.edate DESC").limit(quantity)
   end 
   
   def rating
    reviews.select("avg(rating) as average").first.average.to_i
   end
  
end
