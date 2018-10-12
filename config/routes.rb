Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   namespace :api do
#     namespace :v1 do
#       resources :Accetsuites
#     end
#   end
 # root controller: :accetsuites
 # resources :accetsuites
 get "acceptsuite/index" => "acceptsuites#index"
 end
