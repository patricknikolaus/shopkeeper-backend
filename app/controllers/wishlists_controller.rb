class WishlistsController < ApplicationController
  def index
    if current_user
      wishlist = current_user.games
      render json: wishlist.as_json
    else
      render json: [], status: :unauthorized
    end
  end

  def show
    user = User.find_by(id: params[:id])
    wishlist = user.games
    render json: wishlist.as_json
  end

  def destroy
    if current_user
      game = current_user.games.find_by(id: params[:id])
      game.destroy
      render json: {message: "Game removed from wishlist", game: game}
    else
      render json: [], status: :unauthorized
    end
  end
end
