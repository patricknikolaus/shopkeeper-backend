# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


set = 0
310.times do
    response = HTTP.headers(
    "Client-ID": "#{Rails.application.credentials.igdb_key[:client_id]}",
    "Authorization": "Bearer #{Rails.application.credentials.igdb_key[:access_token]} ",
    "Content-Type": "application/json"
    ).post("https://api.igdb.com/v4/games", :body => "fields id ,cover.*; limit 500; offset #{set};")
    games = JSON.parse(response.body)
    games.each do |game|
      cover = ""
      if game["cover"] == nil
        cover = "https://image.shutterstock.com/image-vector/no-image-available-icon-fow-260nw-1690416772.jpg"
      else
        cover = "https://images.igdb.com/igdb/image/upload/t_1080p/#{game["cover"]["image_id"]}.jpg"
      end
  
      newGame = Cover.new(igdb_id: game["id"], image: "#{cover}")
      newGame.save
    end
    set += 500
  end