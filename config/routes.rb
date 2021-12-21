Rails.application.routes.draw do
  devise_for :users

  root to: 'diaries#index'

  resources :diaries, only:[:create] do
    collection do
      get 'search'
    end
  end
  resources :trends, except:[:index, :update]
  resources :posts, only:[:show]
  resources :notes, only:[:index, :new, :show, :create] do
    resources :note_comments, only:[:create, :show, :destroy]
    resources :note_answers, only:[:create, :show]
  end
  resources :presentations, except:[:edit, :destroy] do
    resources :contents, only:[:new, :create, :edit, :update]
    resources :presentation_comments, only:[:create, :show, :destroy]
    resources :presentation_answers, only:[:create, :show]
  end
  resources :comments, only:[:show]
  resources :opinions, only:[:index, :new, :create, :show]
  resources :followers, only:[:create]
end
