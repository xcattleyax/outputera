Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries, only:[:create]
  resources :trends, except:[:index, :update]
  resources :notes, only:[:index, :new, :create]
  resources :presentations, only:[:new, :create] do
    resources :contents, only:[:new, :create, :edit, :update]
  end
end
