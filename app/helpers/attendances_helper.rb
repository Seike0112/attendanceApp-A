module AttendancesHelper
  
  def attendance_state(attendance)
    # 受け取ったAttendanceオブジェクトが当日と一致するか評価します。
    if Date.current == attendance.worked_on
      return '出勤' if attendance.started_at.nil?
      return '退勤' if attendance.finished_at.nil?
    end
    # どれにも当てはまらなかった場合はfalseを返します。
    false
  end
  
  # 出勤時間と退勤時間を受け取り、在社時間を計算して返します。
  def working_times(start, finish)
    format("%.2f", (((finish.floor_to(15.minutes) - start.floor_to(15.minutes)) / 60) / 60.0))
  end
  
  def attendances_invalid?
    attendances = true
    attendances_params.each do |id, item|
      if item[:started_at].blank? && item[:finished_at].blank?
        next
      elsif item[:started_at].blank? || item[:finished_at].blank?
        attendances = false
        break
      elsif item[:started_at] > item[:finished_at]
        attendances = false
        break
      end
    end
    return attendances
  end
  
  def check_judge
      if @attendance.check_botan == true 
        @attendance.worked_on = @attendance.worked_on
      elsif @attendance.check_botan == false 
        @attendance.worked_on = @attendance.worked_on
      end
  end 
  
  
  
  
  def overtimes_true(overtime, designated_work_end_time)
    format("%.2f", (((overtime - designated_work_end_time).to_i / 60) / 60) + 6)
  end
  
  def overtimes_false(overtime, designated_work_end_time)
    format("%.2f", (((overtime - designated_work_end_time).to_i / 60) / 60) - 18)
  end

  # 勤怠基本情報を指定のフォーマットで返します。 
  def format_basic_info(time)
    format("%.2f", ((time.hour * 60) + time.min) / 60.0)
  end
  
end
