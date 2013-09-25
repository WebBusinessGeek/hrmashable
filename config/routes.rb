CareerThing::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root :to => 'blogs#index'

  resources :blogs, only: :index do
    member do
      get 'follow_blog', as: 'follow'
      get 'unfollow_blog', as: 'unfollow'
      get 'post_comment', as: 'post_comment'
      get 'delete_comment', as: 'delete_comment'
      get 'like_comment', as: 'like_comment'
      get 'unlike_comment', as: 'unlike_comment'
    end
  end

  namespace :admin do
    resources :categories do
      get :get_sub_categories , on: :collection
      get :sub_categories_dropdown , on: :collection
    end
  end
  get '/:year/:month/:day/:id' => 'blogs#show', constraints: {
    year:  /\d{4}/,
    month: /\d{1,2}/,
    day:  /\d{1,2}/
  }, as: 'blog'

  resources :categories, only: :show
  resources :tags, only: :show
  resources :users

  get '/login' => 'users#login', as: 'login'
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', to: redirect('/')
  match '/signout', to: 'sessions#destroy', as: 'signout'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
