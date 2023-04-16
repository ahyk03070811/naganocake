Rails.application.routes.draw do

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end



  scope module: 'public' do
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
    resources :cart_items, only: [:index, :create, :destroy, :update]
    resources :orders, only: [:create, :show, :index]
    get 'customers/my_page' => 'customers#show'
    get 'customers/info/edit' => 'customers#edit'
    patch 'customers/info' => 'customers#update'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    get '/orders/new' => 'orders#new'
    post '/orders/comfirm' => 'orders#comfirm'
    get '/orders/complete' => 'orders#complete'
   end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
