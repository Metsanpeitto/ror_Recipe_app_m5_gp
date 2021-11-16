Rails.application.routes.draw do
    devise_for :users
    root "foods#index"      
    resources :foods, only: %i[create new destroy index show]
    resources :recipes, only: %i[create new destroy index show]
    resources :inventories, only: %i[create new destroy index show]

end
