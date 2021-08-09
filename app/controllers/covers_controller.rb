class CoversController < ApplicationController
  def index
    covers = Cover.all
    render json: covers.as_json
  end
  
  def show
    cover = Cover.find_by(igdb_id: params[:id])
    render json: cover.as_json
  end
end
