Rails.application.routes.draw do
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers, path: 'customers', controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    omniauth_callbacks: 'public/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    root to: 'homes#top'
    get '/privacy_policy', to: 'homes#privacy_policy'
    resources :customers, only:[:show]
    get '/current_customer/profile', to: 'customers#profile'
    patch '/current_customer', to: 'customers#update'
    get '/current_customer/cancel', to: 'customers#cancel'
    patch '/current_customer/quit', to: 'customers#quit'
    resources :lessons do
      collection do
        get :search
        post :result
      end
    end
    resources :cart_lessons, only:[:create, :index, :destroy]
    resources :orders, only:[:new] do
      collection do
        post :confirmation
        get :completed
        post :create, path: 'completed'
      end
    end
    resources :addresses, except:[:new, :show]
    resources :have_lessons, only:[:index, :show, :update]
    resources :evaluations, only:[:new, :create, :show, :index]
    resources :comments
    resources :payment_methods, except:[:new, :show, :edit, :update]
    get "/callback", to:"calendars#initialize"
    get "/calendar/index", to:"calendars#index"
  end

  namespace :admin do
    root to: 'homes#top'
    resources :customers, except:[:new, :create, :destroy]
    resources :categories, except:[:new, :show, :edit]
    resources :lessons, except:[:new, :create, :edit, :update]
    resources :tags, only:[:index, :destroy]
    resources :evaluations, only:[:show, :index]
    resources :orders, only:[:show, :update]
  end
end
