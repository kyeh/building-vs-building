get '/' do
  @list_of_ids = Building.all.map { |building| building.id }
  @random_building1 = Building.find(@list_of_ids.shuffle!.pop)
  @random_building2 = Building.find(@list_of_ids.shuffle!.pop)
  # @winner = Building.get_taller_building(@random_building1.id, @random_building2.id)
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

post '/answer' do
  @random_building1 = Building.find(params[:combatant1])
  @random_building2 = Building.find(params[:combatant2])
  @guess = params[:taller]=="combatant1" ? @random_building1 : @random_building2
  @winner = Building.get_taller_building(@random_building1.id, @random_building2.id)
  p "params are : #{params}"
  erb :index
end
