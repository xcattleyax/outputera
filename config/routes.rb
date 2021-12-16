Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries, only:[:create]
  resources :trends, except:[:index, :update]
  resources :notes, only:[:index, :new, :show, :create]
  resources :presentations, only:[:index, :new, :create, :show, :update] do
    resources :contents, only:[:new, :create, :edit, :update]
  end
end
