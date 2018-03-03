Rails.application.routes.draw do

  resources :slogans
  resources :work_lists

  get '/all_slogans',to:'slogans#show_all'
  get '/random_slogans',to:'slogans#random_show'

  root 'work_lists#show'

end
