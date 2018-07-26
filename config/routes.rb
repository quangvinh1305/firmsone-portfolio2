Rails.application.routes.draw do
  resources :topics, only: [:index, :show]

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'
  post '/upload_image' => 'froala#upload_image', :as => :froala_upload_image
  post '/upload_image_jpeg' => 'froala#upload_image_jpeg', :as => :froala_upload_image_jpeg
  post '/upload_image_resize' => 'froala#upload_image_resize', :as => :froala_upload_image_resize
  post '/upload_image_validation' => 'froala#upload_image_validation', :as => :froala_upload_image_validation
  post '/delete_image' => 'froala#delete_image', :as => :froala_delete_image

  post '/upload_file' => 'froala#upload_file', :as => :froala_upload_file
  post '/upload_file_validation' => 'froala#upload_file_validation', :as => :froala_upload_file_validation
  post '/delete_file' => 'froala#delete_file', :as => :froala_delete_file

  post '/upload_video' => 'froala#upload_video', :as => :froala_upload_video

  get '/uploads/:name' => 'froala#access_file', :as => :froala_upload_access_file, :name => /.*/
  get '/load_images' => 'froala#load_images', :as => :froala_load_images

  get '/' => 'froala#index', :as => :root
  root to: 'pages#home'
end
