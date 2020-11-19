Rails.application.routes.draw do

  get 'results/index'
  get 'results/new'
  get 'results/edit'
  get 'records/index'
  get 'records/show'
  get 'records/edit'
  get 'records/new'
  get 'tabs/index'
  root 'calendars#index'
  resources:records
  resources:targets
  resources:results
  resources:calories_burned
  resources:foods
  resources:tabs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
