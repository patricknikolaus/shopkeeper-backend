class WishlistsController < ApplicationController
  def index
    if current_user
      wishlist = current_user.wishlists
      render json: wishlist.as_json
    else
      render json: [], status: :unauthorized
    end
  end

  def show
    user = User.find_by(id: params[:id])
    wishlist = user.wishlists
    render json: wishlist.as_json
  end

  def create
    game = Wishlist.new(
      user_id: current_user.id,
      game_id: params[:game_id],
      image_url: params[:image_url],
      title: params[:title],
      on_sale: params[:on_sale]
    )
    user = User.find_by(id: current_user.id)
    if user.wishlists.find_by(game_id: params[:game_id])
      render json: {errors: game.errors.full_messages}, status: :unprocessable_entity
    else
      game.save
      render json: {game: game}
    end
  end

  def destroy
    if current_user
      game = current_user.wishlists.find_by(id: params[:id])
      game.destroy
      render json: {message: "Game removed from wishlist", game: game}
    else
      render json: [], status: :unauthorized
    end
  end
end
