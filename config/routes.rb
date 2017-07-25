Rails.application.routes.draw do
  namespace :api , defaults: { format: :json } do
   get 'comics' => 'comics#index'
   get 'comics/upvotes' => 'comics#upvotes'
   put 'comics/:comic_id/upvote' => 'comics#upvote'
  end
end
