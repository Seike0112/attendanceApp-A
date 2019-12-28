Rails.application.routes.draw do

  get 'bases/index'

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  
  # ログイン機能
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # 出勤中社員一覧
  get '/working_users', to: 'users#working_users'
  
  # 上長申請
  get 'users/attendances/overtime_admin', to: 'users#overtime_admin'
  
  # 拠点resources
  resources :bases
  

  
  resources :users do 
    collection do
      get '/search', to: 'users#search' 
      post :import
    end
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month'
      get 'attendances/attendance_index'
      patch 'user_index_edit'
      get 'attendance_log'
      #未実装 勤怠ログ
      patch 'log-update'
      #実装中 １ヶ月分の勤怠申請
    end
    resources :attendances, only: [:update] do
      get 'overtime'
      patch 'overtime_application'
      collection do
        get 'overtime_admin'
      end
    end
  end

end
