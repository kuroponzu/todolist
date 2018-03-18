Rails.application.routes.draw do

  resources :slogans
  resources :work_lists

  get '/all_slogans',to:'slogans#show_all'
  get '/random_slogans',to:'slogans#random_show'

  get '/all_work_list',to:'work_lists#show_all'
  get '/random_slogans',to:'work_lists#random_show'

  root 'work_lists#show'

end
