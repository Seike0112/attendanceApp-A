include AttendancesHelper
class AttendancesController < ApplicationController
  
  
  before_action :set_user, only: [:edit_one_month, :update_one_month]
  before_action :logged_in_user, only: [:update, :edit_one_month]
  before_action :admin_or_correct_user, only: [:update, :edit_one_month, :update_one_month]
  before_action :set_one_month, only: :edit_one_month

  UPDATE_ERROR_MSG = "勤怠登録に失敗しました。やり直してください。"

  def update
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    # 出勤時間が未登録であることを判定します。
    if @attendance.started_at.nil? 
      if @attendance.update_attributes(started_at: Time.current.change(sec: 0))
        flash[:info] = "おはようございます！"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    elsif @attendance.finished_at.nil?
      if @attendance.update_attributes(finished_at: Time.current.change(sec: 0))
        flash[:info] = "お疲れ様でした。"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    end
    redirect_to @user
  end

  def edit_one_month
  end

  def update_one_month
    ActiveRecord::Base.transaction do
      if edit_invalid?
        attendances_params.each do |id, item|
          attendance = Attendance.find(id)
          attendance.update_attributes!(item)
        end
        flash[:success] = "1ヶ月分の勤怠情報を更新しました。"
        redirect_to user_url(date: params[:date])
      else
        flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
        redirect_to attendances_edit_one_month_user_url(date: params[:date])
      end
    end
  rescue ActiveRecord::RecordInvalid
      flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
      redirect_to attendances_edit_one_month_user_url(date: params[:date])
  end
  
  def overtime
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:attendance_id])
    @superior = User.where.not(id: current_user).where.not(superior: false).pluck(:name)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def overtime_application
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:attendance_id])
    check_judge
      @attendance.update_attributes(overtime_params)
      if @attendance.overtime_application.present?
        flash[:success] = "#{@attendance.overtime_application}様に残業申請を送信しました。"
        redirect_to @user
      else
        flash[:danger] = "再度申請を行なってください。"
        redirect_to @user
      end
  end
  
  
  

  private

    # 1ヶ��分の勤怠情報を扱います。
    def attendances_params
      params.require(:user).permit(attendances: [:started_at, :finished_at, :note, :edit_app_n, :edit_next_d, :edit_start, :edit_finish])[:attendances]
    end
    
    # 1ヶ月分の残業情報を扱います。
    def overtime_params
      params.require(:attendance).permit(:worked_on, :overtime, :overtime_note, :check_botan, :overtime_application)
    end

    # beforeフィルター

    # 管理権限者、または現在ログインしているユーザーを許可します。
    def admin_or_correct_user
      @user = User.find(params[:user_id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "編集権限がありません。"
        redirect_to(root_url)
      end  
    end
    
 
  
end