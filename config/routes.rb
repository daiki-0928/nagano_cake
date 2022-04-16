Rails.application.routes.draw do

   root to: "homes#top"

  scope module: :public do

    get "/about" => "homes#about", as: "about"
    post 'orders/confirm'
    get 'orders/thanks'
    delete 'cart_items/destroy_all'
    get "/customers/my_page" => "customers#show"
    resources :customers, only: [:show, :edit, :update,]
    resources :items, only: [:index, :show,]
    resources :cart_items, only: [:index, :update, :create, :destroy]
    resources :orders, only:[:new, :show, :index, :create]

  end

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:new, :index, :show, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

end
