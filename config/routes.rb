Rails.application.routes.draw do
   # games
   post "/games" => "games#index"
   post "/games/:id" => "games#show"
   # get "games/twitch" => "games#twitch"
 
   # login
   post "/sessions" => "sessions#create"
 
   #wishlist
   get "/wishlists" => "wishlists#index"
   get "/wishlists/:id" => "wishlists#show"
   post "/wishlists" => "wishlists#create"
   delete "/wishlists/:id" => "wishlists#destroy"
 
   # users
   post "/users" => "users#create"

   #covers
   get "/covers" => "covers#index"
   get "/covers/:id" => "covers#show"

   #twitch
   get "/twitch" => "twitch#index"
   get "/twitch/channel" => "twitch#channel"
end
