

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :blog_posts do
    resource :cover_image, only: [:destroy], module: :blog_posts
  end

  # Defines the root path route ("/")
  root "blog_posts#index"
end




# Rails.application.routes.draw do
#   devise_for :users
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   mount ActionText::Engine => '/action_text'
#   get "up" => "rails/health#show", as: :rails_health_check
#   resources :blog_posts do
#     resource :cover_image, only: [:destroy], module: :blog_posts
#   end

#   # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
#   # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
#   # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

#   # Option 1:
#   get "blog_posts/new" => "blog_posts#new", as: :new_blog_post
#   get "blog_posts/:id" => "blog_posts#show", as: :blog_post
#   delete "blog_posts/:id" => "blog_posts#destroy"
#   patch "blog_posts/:id" => "blog_posts#update"
#   get "blog_posts/:id/edit" => "blog_posts#edit", as: :edit_blog_post
#   post "blog_posts" => "blog_posts#create", as: :blog_posts

#   # Option 2: 
#   # resources :blog_posts

#   # Defines the root path route ("/")
#    root "blog_posts#index"
# end
