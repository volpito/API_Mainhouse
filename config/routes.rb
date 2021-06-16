Rails.application.routes.draw do
  resources :agencies
  resources :owners
  resources :buildings
  resources :events
  get '/agency-owners/:id', to: 'agencies#show_owner'
  devise_for :agencies,
             controllers: {
                 sessions: 'agencies/sessions',
                 registrations: 'agencies/registrations'
             }
  devise_for :owners,
             controllers: {
                 sessions: 'owners/sessions',
                 registrations: 'owners/registrations'
             }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end