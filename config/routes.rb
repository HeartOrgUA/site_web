Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :admin do
    resources :news
    resources :news_subscribes
    resources :users
    resources :user_groups
    resources :vacancies
    resources :volunteers
    resources :aeds
    resources :aed_models
    resources :projects
    resources :trainings
    resources :tags
    resources :settings
    root 'users#index'
  end

  root 'welcome#index'
  post :subscribe, controller: :welcome
  %i(about volonteer contacts donate your_health).each do |rt|
    get rt, controller: :welcome
  end

  resources :aeds, only: %i(index create)
  resources :projects, only: %i(index show)
  resources :trainings, only: %i(index show) do
    post :submit_participant, on: :member
  end
  resources :users, only: :create
  resources :news, only: %i(index show), concerns: :paginatable
  resources :volunteers, only: :create
end

