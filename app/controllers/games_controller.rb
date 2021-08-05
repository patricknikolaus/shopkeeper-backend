class GamesController < ApplicationController
  def index
    response = HTTP.headers("Authorization" => "Bearer ", "Client-ID" => "").post("https://api.igdb.com/v4/games", :body => 'fields id, name, platforms, genres.name, cover.url; search "%{game_name}"; where release_dates.platform = 6; limit 50;' % {game_name:params[:search]})

    render json: response.parse(:json)
  end
end
