class GamesController < ApplicationController
  def index
    response = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.igdb_key[:access_token]}", "Client-ID" => "#{Rails.application.credentials.igdb_key[:client_id]}").post("https://api.igdb.com/v4/games", :body => 'fields id, name, platforms, genres.name, cover.url; search "%{game_name}"; where release_dates.platform = 6; limit 50;' % {game_name:params[:search]})

    render json: response.parse(:json)
  end

  def show
    response = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.igdb_key[:access_token]}", "Client-ID" => "#{Rails.application.credentials.igdb_key[:client_id]}").post("https://api.igdb.com/v4/games", :body => 'fields id, name, rating, screenshots.*, videos.*, platforms.name, genres.name, cover.url, similar_games.name, summary, release_dates.y; where id = %{game_id};' % {game_id:params[:id]})

    render json: response.parse(:json)
  end


end
