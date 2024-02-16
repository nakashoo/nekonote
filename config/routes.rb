Rails.application.routes.draw do

  # 運営用
  # URL /admin/sign_in ...
  devise_for :admins, skip: [:passwords] ,controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  # サークル員用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :admin do
    post "admin/guest_sign_in", to: "admin/sessions#guest_sign_in"
  end

  devise_scope :customer do
    post "public/guest_sign_in", to: "public/sessions#guest_sign_in"
  end


 # 運営用
  namespace :admin do
   get 'admins/my_page' => 'admins#show'
   get 'admins/infomation/edit' => 'admins#edit'
   patch 'admins/information' => 'admins#update'
   post 'admins/my_page' => 'admins#show', as: 'admin_admins_my_page'
   get 'notes/new' => 'notes#new', as: 'new_admin_note'
   resources :notes
   resources :links
   resources :contacts, only: [:index,:show]
   resources :places, only: [:index, :create, :edit, :update, :destroy]
   resources :tasks, only: [:index, :create, :edit, :update, :destroy]
   resources :schedules
  end


 # サークル用
  scope module: :public do
    get 'customers/my_page' => 'customers#show'
    get 'costomers/infomation/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    resources :notes, only: [:index,:show]
    resources :links, only: [:index]
    resources :contacts, only: [:index,:new,:create,:show,:destroy] do
      get 'thanks' => 'contacts#thanks'
    end
  end

end
