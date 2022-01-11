Rails.application.routes.draw do
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers, path: 'customers', controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    root to: 'homes#top'
    resources :customers, only:[:show]
    get '/current_customer/unique', to: 'customers#unique'
    get '/current_customer/personal', to: 'customers#personal'
    get '/current_customer/transfer', to: 'customers#transfer'
    patch '/current_customer', to: 'customers#update'
    get '/current_customer/cancel', to: 'customers#cancel'
    patch '/current_customer/quit', to: 'customers#quit'
    resources :lessons, except:[:destroy]
    resources :cart_lessons, only:[:create, :index, :destroy]
    resources :orders, only:[:new]
    post '/orders/confirmation', to: 'orders#confirmation'
    get '/orders/completed', to: 'orders#completed'
    post '/orders/completed', to: 'orders#create'
    resources :addresses, except:[:new, :show]
    resources :have_lessons, only:[:index, :show, :update]
    resources :evaluations, only:[:new, :create, :show, :index]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :customers, except:[:new, :create, :destroy]
    resources :categories, except:[:new, :show]
  end
end
