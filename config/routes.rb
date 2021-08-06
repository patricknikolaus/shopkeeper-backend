Rails.application.routes.draw do
   # games
   post "/games" => "games#index"
   post "/games/:id" => "games#show"
 
   # login
   post "/sessions" => "sessions#create"
 
   #wishlist
   get "/wishlists" => "wishlists#index"
   get "/wishlists/:id" => "wishlists#show"
   delete "/wishlists/:id" => "wishlists#destroy"
 
   # users
   post "/users" => "users#create"
end
