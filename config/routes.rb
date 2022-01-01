Rails.application.routes.draw do
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers, path: 'customers', controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    root to: 'homes#top'
    resources :lessons, except:[:destroy]
  end
end
