class TwitchController < ApplicationController
  def index
    response = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.twitch_key[:access_token]}", "Client-ID" => "#{Rails.application.credentials.igdb_key[:client_id]}").get("https://api.twitch.tv/helix/games?name=#{params[:name]}")

    render json: response.parse(:json)
  end

  def channel
    response = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.twitch_key[:access_token]}", "Client-ID" => "#{Rails.application.credentials.igdb_key[:client_id]}").get("https://api.twitch.tv/helix/streams?game_id=#{params[:game_id]}")

    render json: response.parse(:json)
  end
end
