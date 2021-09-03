class GamesController < ApplicationController
  def index
    random = rand(1..1000)
    if params[:search] == ""
      response = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.igdb_key[:access_token]}", "Client-ID" => "#{Rails.application.credentials.igdb_key[:client_id]}").post("https://api.igdb.com/v4/games", :body => "fields id, name, platforms, cover.url; where platforms = 6 & themes != [42] & cover != null & rating > 70; limit 24; offset #{random};")
    else
      response = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.igdb_key[:access_token]}", "Client-ID" => "#{Rails.application.credentials.igdb_key[:client_id]}").post("https://api.igdb.com/v4/games", :body => 'fields id, name, platforms, genres.name, cover.url; where platforms = (1,6) & themes != [42] & cover != null; search "%{game_name}"; limit 24;' % {game_name:params[:search]})
    end

    render json: response.parse(:json)
  end

  def show
    response = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.igdb_key[:access_token]}", "Client-ID" => "#{Rails.application.credentials.igdb_key[:client_id]}").post("https://api.igdb.com/v4/games", :body => 'fields id, name, rating, screenshots.*, videos.*, platforms.name, genres.name, cover.url, similar_games.name, summary, release_dates.y; where id = %{game_id};' % {game_id:params[:id]})

    render json: response.parse(:json)
  end
end
