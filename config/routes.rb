Rails.application.routes.draw do

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

   root to: "homes#top"
   get 'about' => 'homes#about'

  scope module: :public do

    post 'orders/confirm'
    get 'orders/thanks'
    delete 'cart_items/destroy_all'
    get "/customers/my_page" => "customers#show"
    get "/customers/confirm" => "customers#confirm"
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :customers, only: [:show, :edit, :update,]

    resources :items, only: [:index, :show,]
    resources :cart_items, only: [:index, :update, :create, :destroy]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
    resources :orders, only:[:new, :show, :index, :create]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]



  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :items, only: [:new, :index, :show, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

end
