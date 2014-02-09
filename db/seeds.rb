require 'csv'

# BANDNAMES = [ "Joy Division", "New Order", "The Smiths", "The Sisters of Mercy", "Wye Oak", "Thao and the Get Down Stay Down",
#           "Siouxsie and the Banshees", "Interpol" ]

# BANDNAMES.each{ |band_name| Band.create(name: band_name) }
Building.delete_all

CSV.foreach(File.expand_path('tall_buildings.csv','./db'), {headers: true}) do |row|
  puts row["Building_and_Location"]
  Building.create(name: row["Building_and_Location"], height: row["height_feet"])
end

CSV.foreach(File.expand_path('building_urls.csv','./db')) do |row|
  puts "#{row[0]} --url: #{row[1]}"
  building = Building.find_by_name(row[0])
  if building
    building.photo_url=row[1]
    building.save
  end
end

puts "finished seeding #{Building.count} buildings"