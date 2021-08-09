class GamesController < ApplicationController
  def index
    random = rand(44000)
    if params[:search] == ""
      response = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.igdb_key[:access_token]}", "Client-ID" => "#{Rails.application.credentials.igdb_key[:client_id]}").post("https://api.igdb.com/v4/games", :body => "fields id, name, platforms, genres.name, cover.url; where platforms = 6 & themes != [42]; limit 20; offset #{random};")
    else
      response = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.igdb_key[:access_token]}", "Client-ID" => "#{Rails.application.credentials.igdb_key[:client_id]}").post("https://api.igdb.com/v4/games", :body => 'fields id, name, platforms, genres.name, cover.url; where platforms = (1,6); search "%{game_name}"; limit 50;' % {game_name:params[:search]})
    end

    render json: response.parse(:json)
  end

  def show
    response = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.igdb_key[:access_token]}", "Client-ID" => "#{Rails.application.credentials.igdb_key[:client_id]}").post("https://api.igdb.com/v4/games", :body => 'fields id, name, rating, screenshots.*, videos.*, platforms.name, genres.name, cover.url, similar_games.name, summary, release_dates.y; where id = %{game_id};' % {game_id:params[:id]})

    render json: response.parse(:json)
  end
end
