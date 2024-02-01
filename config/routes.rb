Rails.application.routes.draw do

  devise_for :users
  root to: 'furimas#index'
  resources :furimas, only:[:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :orders, only: [:index, :create]
  end
  # 他のルートがあればここに追加
end