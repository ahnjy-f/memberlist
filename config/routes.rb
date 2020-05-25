Rails.application.routes.draw do
  
  namespace :account do
    root "top#index"
    get "login" => "sessions#new", as: :login
    get "show" => "sessions#show", as: :show
    post "post/:id" => "postlist#post"
    post "reply/:id" => "postlist#reply"
    post "post_like/:id" => "postlist#post_like"
    post "reply_like/:id" => "postlist#reply_like"
    
    resource :session, only: [ :create, :destroy]
    
    # get "members/show" #フロフィール画面
    get "passwords/edit" => "passwords#edit" 
    get "members/index" #メンーバ一覧
    get "members/:id/detail" => "members#detail"
    patch "passwords/edit" => "passwords#update"
    
    resources :members, except: [ :destroy ]

    get "members/:id/edit" => "members#edit"
    post "members/:id/edit" => "members#edit"
    patch "members/:id" => "members#update"
    get "admin/show" => "admin#show"

    resources :admin, except: [ :destroy ]
    get "admin/new" => "admin#new"
    # post "admin" => "admin#create"
    post "admin/new" => "admin#create"
    get "admin/:id/edit" => "admin#edit"
    patch "admin/:id" =>"admin#update"

    get "admin/result" => "admin#result"
    post "admin/result" => "admin#result"
    patch "admin/result" => "admin#result"

    resources :post, only: [ :index, :create, :destroy]
    resources :postlist, only: [ :index, :create, :destroy]
    resources :likelist, only: [ :index, :create, :destroy]

    get "certification" => "top#certification"
    get "change" => "top#change"
    post "change" => "top#change"
    patch "change/:id" => "top#update"
    
  end

end

