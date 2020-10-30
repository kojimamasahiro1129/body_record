Rails.application.routes.draw do
  get 'records/index'
  get 'records/show'
  get 'records/edit'
  get 'records/new'
  get 'tabs/index'
  root 'calendars#index'
  resources:records
  resources:targets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
