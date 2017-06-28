Rails.application.routes.draw do
  resources :stories do
    resources :sentences
  end
  # 
  # resources :images  do
  #   resources :sentences
  # end
end
