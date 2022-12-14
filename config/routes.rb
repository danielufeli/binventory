Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  namespace :api do
    namespace :v1 do
      resources :glasses
          resources :currency_rates
          resources :lenses
          resources :frames
    end
  end
end
