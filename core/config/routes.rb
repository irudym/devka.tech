Rails.application.routes.draw do
  namespace :admin do
    get 'avatars/index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :v1 do
    post 'signup', to: 'users#create'
    post 'login', to: 'authentication#authenticate'

    get 'questions/users/:user_id' => 'questions#users', defaults: { format: :json }
    get 'questions/tags/:tag' => 'questions#tags', defaults: { format: :json }
    resources :questions, defaults: { format: :json }
    resources :tags, defaults: { format: :json}
    resources :avatar_bodies, defaults: { format: :json}
    resources :avatar_eyes, defaults: { format: :json}
    resources :avatar_noses, defaults: { format: :json}
    resources :avatar_hairs, defaults: { format: :json}
  end

  scope module: :admin do
    get 'admin', to: 'admin#index'
    get 'admin/avatars', to: 'avatars#index'
  end
end
