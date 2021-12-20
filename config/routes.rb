Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries, only:[:create]
  resources :trends, except:[:index, :update]
  resources :notes, only:[:index, :new, :show, :create] do
    resources :note_comments, only:[:create, :show, :destroy]
    resources :note_answers, only:[:create, :show]
  end
  resources :presentations, only:[:index, :new, :create, :show, :update] do
    resources :contents, only:[:new, :create, :edit, :update]
    resources :presentation_comments, only:[:create, :show, :destroy]
    resources :presentation_answers, only:[:create]
  end
  resources :comments, only:[:show]
end
