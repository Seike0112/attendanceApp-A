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
      #残業申請　上長
      get 'overtime_admin'
      patch 'overtime_admin_update'
      #１ヶ月分の勤怠情報申請
      patch 'one_month_application'
      get 'modal_one_month'
      patch 'admin_modal_one_month'
      # 勤怠変更申請
      get 'edit_superior'
      patch 'edit_superior_update'
    end
    resources :attendances, only: [:update] do
      get 'overtime'
      patch 'overtime_application'
      collection do
      end
    end
  end

end
