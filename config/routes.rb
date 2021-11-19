Rails.application.routes.draw do
    devise_for :users
    root "recipes#index"  
   
    resources :foods, only: %i[create new destroy index show]
    resources :recipes, only: %i[create new destroy index show] do
        resources :recipe_foods, only: [:new, :edit]
    end  
    resources :recipe_foods, only: %i[create new destroy]
    resources :inventories, only: %i[create new destroy index show]
    resources :inventory_foods, only: %i[create new destroy]

end
