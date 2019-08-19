Rails.application.routes.draw do
  get 'new', to: 'games#new', as: :new_get
  post 'score', to: 'games#score', as: :score_post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
