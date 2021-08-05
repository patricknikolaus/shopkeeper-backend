class UsersController < ApplicationController
  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    user.save
    render json: user.as_json
  end
end
