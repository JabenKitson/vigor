class InsertDataIntoVrattributes < ActiveRecord::Migration
def change

["Good for Groups","Accepts Credit Cards","ParkingGarage","Street Parking","Free Parking","Formal","Business Casual","Good For Dinner","Good For Lunch","Good For Breakfast","Beer","Wine","Liquor","Quiet","Loud","Romantic","Upscale","Has TV","Caters","Wheelchair Accessible","Good for Kids","Takes Reservations","Delivery","Take-out","Waiter Service","Outdoor Seating","Free Wi-Fi","Vegan Options","Entirely Meat Free","Entirely Vegan","Gluten Free Options","Oil Free Options","Macrobiotic Options","Vegetarian Options","Organic Options","Raw Options"].each do |vrname| 
  Vrattribute.create(:name => vrname, :vrtype => 'restaurant')
end

["Fresh Produce","Bulk","Accepts Credit Cards","Parking Garage","Street Parking","Free Parking","Organic Produce","Organic Products","Vegan Deli Items","Vegetarian Deli Items","Macrobiotic Deli Items","Organic Deli Items","Vegan Bakery Items","Gluten Free Bakery Items","Local Produce","Catering","Custom Orders","Delivery"].each do |vrname| 
  Vrattribute.create(:name => vrname, :vrtype => 'grocer')
end

end
end
