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
        @attendance.worked_on = Date.tomorrow
      elsif @attendance.check_botan == false 
        @attendance.worked_on = Date.current
      end
  end 
  
  
  
  
  def overtimes_true(overtime, designated_work_end_time)
    format("%.2f", (((overtime.to_i - designated_work_end_time.to_i) + 24) / 60) / 60)
    
  end
  
  def overtimes_false(overtime, designated_work_end_time)
    format("%.2f", (((overtime - designated_work_end_time) / 60) / 60))
  end
  
end
