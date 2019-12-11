class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info, :user_index_edit, :attendance_log]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:index, :destroy, :edit_basic_info, :update_basic_info]
  before_action :set_one_month, only: :show
  before_action :admin_or_correct_user, only: [:show, :edit, :update]
  
  def index
    @users = set_search.paginate(page: params[:page]).includes(:attendances)
    @user = User.new
  end
  
  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end
  
  def new
    # ユーザーオブジェクトを生成し、インスタンス変数に代入します。
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # 保存成功後、ログインします。
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @user
    else
      render :edit
    end
  end
  
  def update_user
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to current_user
    else
      render :index
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  def search
    @users = set_search.paginate(page: params[:page])
  end  
  
  def import
      # fileはtmpに自動で一時保存される
    if User.import(params[:file])
      flash[:success] = "CSVファイルを読み込みました。"
      redirect_to users_url 
    else
      flash[:danger] = "CSVファイルを読み込めませんでした。"
      redirect_to users_url
    end
  end
  
  def working_users
    @users = User.all.includes(:attendances)
  end  
  
  def edit_basic_info
  end
  
  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end
  
  def user_index_edit
    @users = User.all
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to users_url
    else
      flash[:danger] = "ユーザー情報を更新できませんでした。"
      redirect_to users_url
    end
  end
  
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :department, :password, :password_confirmation, :employee_number, :u_id, :basic_time, :designated_work_start_time, :designated_work_end_time, :superior)
    end
    
    def set_search
      if params[:user].present? && params[:user][:name]
        User.where('name LIKE ?', "%#{params[:user][:name]}%")
      else
        User.all
      end
    end
    

    
    def basic_info_params
      params.require(:user).permit(:department, :basic_time, :work_time)
    end
    
    # 管理権限者、または現在ログインしているユーザーを許可します。
    def admin_or_correct_user
      @user = User.find(params[:user_id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "編集権限がありません。"
        redirect_to(root_url)
      end  
    end

end
