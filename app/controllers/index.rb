get '/' do
  @list_of_ids = Building.all.map { |building| building.id }
  @random_building1 = Building.find(@list_of_ids.shuffle!.pop)
  @random_building2 = Building.find(@list_of_ids.shuffle!.pop)
  @random_building3 = Building.find(@list_of_ids.shuffle!.pop)
  @random_building4 = Building.find(@list_of_ids.shuffle!.pop)
  @random_building5 = Building.find(@list_of_ids.shuffle!.pop)
  @random_building6 = Building.find(@list_of_ids.shuffle!.pop)
  @random_building7 = Building.find(@list_of_ids.shuffle!.pop)

  image = MiniMagick::Image.open(@random_building3.photo_url)
  image.resize "150x150"
  image.write  "output3.jpg"

  image = MiniMagick::Image.open(@random_building4.photo_url)
  image.resize "150x150"
  image.write  "output4.jpg"

  image = MiniMagick::Image.open(@random_building5.photo_url)
  image.resize "150x150"
  image.write  "output5.jpg"

  image = MiniMagick::Image.open(@random_building6.photo_url)
  image.resize "150x150"
  image.write  "output6.jpg"

  image = MiniMagick::Image.open(@random_building7.photo_url)
  image.resize "150x150"
  image.write  "output7.jpg"

  erb :drag_and_drop
end

get '/bands' do
  @band_names = Band.all.map(&:name)
  erb :bands
end

post '/bands' do
  new_band = Band.create!(name: params[:name])
  new_band.name
end

get '/info' do
  Demo.new(self).info
end

post '/answer' do
  @random_building1 = Building.find(params[:combatant1])
  @random_building2 = Building.find(params[:combatant2])
  @guess = params[:taller]=="combatant1" ? @random_building1 : @random_building2
  @winner = Building.get_taller_building(@random_building1.id, @random_building2.id)
  p "params are : #{params}"
  erb :index
end
