Rails.application.routes.draw do
  root 'sessions#new' # Renders Log/Reg Page
  post 'users/login' => 'sessions#create' # Login
  post 'users/new' => 'users#create' # Register
  delete 'sessions/:user_id' => 'sessions#destroy' # Logout
  
  get 'ideas' => 'ideas#ideas' # Renders Ideas Page
  post 'createidea' => 'ideas#create' # Creates Idea
  get 'ideas/:idea_id' => 'ideas#oneIdea' # Renders One Idea Page
  post 'add/:idea_id' => 'ideas#add' # Likes Idea
  delete "ideas/:idea_id" => "ideas#delete"

  get 'users/:user_id' => 'users#show' # Renders Users Page
end