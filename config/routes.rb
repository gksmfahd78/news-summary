Rails.application.routes.draw do

  root 'homes#index'
  
  get 'homes/index' => 'homes#index'
  
  post 'homes/fake_news' => 'homes#fake_news'
  
  get 'homes/index_json' => 'homes#index_json'

  resources :all_notices
  
  get 'homes/index'
  
  get 'users/page/:id' => 'users#page'
  
  # User 리스트를 json으로 받아옴.
  get 'users/user_list'
  
  #쪽지
  get '/users/message'
  delete '/users/message/:id' => 'messages#destroy'
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  resources :messages, only: [:hide_message] do
    member do
      put "hide_message", to: "messages#hide_message"
      put "hide_message_their", to: "messages#hide_message_their"
    end
  end
  
  #검색 결과
  get 'searches/index' => 'searches#index'
  get 'homes/news_search' => 'homes#news_search'
  
  #알림 : 전체 삭제
  get '/new_notifications/read_all' => 'new_notifications#read_all'
  #알림
  resources :new_notifications
  
  resources :comments, only: [:create, :destroy, :edit, :update] do
    member do
      put "like", to:    "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
  end
  
  resources :posts
  
  resources :bulletins do
    # 해시태그
    get 'posts/hashtag/:name', to: 'posts#hashtags'
    resources :posts do
      post "/restore", to: "posts#restore"
      member do
        put "like", to:    "posts#upvote"
        put "dislike", to: "posts#downvote"
      end
    end
  end
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
