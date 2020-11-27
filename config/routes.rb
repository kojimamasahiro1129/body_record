Rails.application.routes.draw do


  get 'results/index'
  get 'results/new'
  get 'results/edit'
  get 'records/index'
  get 'records/show'
  get 'records/edit'
  get 'records/new'
  # get 'tabs/index'
  root 'tabs#index'
  resources:records
  resources:targets
  resources:results
  resources:calories_burned
  resources:foods
  resources:tabs
  resources:gym_lists
  resources:calories_burneds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
