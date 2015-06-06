GoogleCalendar::Application.routes.draw do
  namespace :api do
    resources :meetings, only: [:index]
  end
end
