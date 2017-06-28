Rails.application.routes.draw do
  resources :stories do
    resources :sentences
  end

  root :to => 'stories#index'
  #
  # resources :images  do
  #   resources :sentences
  # end
end
