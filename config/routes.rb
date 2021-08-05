Rails.application.routes.draw do
   # games
   get "/games" => "games#index"
   get "/games/:id" => "games#show"
 
   # login
   post "/sessions" => "sessions#create"
 
   #wishlistgames
   get "/wishlists" => "wishlists#index"
   get "/wishlists/:id" => "wishlists#show"
   delete "/wishlists/:id" => "wishlists#destroy"
 
   # users
   post "/users" => "users#create"
end
