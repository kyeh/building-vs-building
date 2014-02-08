get '/' do
  @list_of_ids = Building.all.map { |building| building.id }
  @random_building1 = Building.find(@list_of_ids.shuffle!.pop)
  @random_building2 = Building.find(@list_of_ids.shuffle!.pop)
  erb :index
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
