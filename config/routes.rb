MashableBlog::Application.routes.draw do
  root :to => 'blogs#index'

  resources :blogs, only: :index do
    member do
      get 'follow_blog', as: 'follow'
      get 'unfollow_blog', as: 'unfollow'
      get 'post_comment', as: 'post_comment'
      get 'delete_comment', as: 'delete_comment'
    end
  end

  get '/:year/:month/:day/:id' => 'blogs#show', constraints: {
    year:  /\d{4}/,
    month: /\d{1,2}/,
    day:  /\d{1,2}/
  }, as: 'blog'

  resources :categories, only: :show, path: 'category'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end