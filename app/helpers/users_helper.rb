module UsersHelper
  
  # 勤怠基本情報を指定のフォーマットで返します。 
  def format_basic_info(time)
    format("%.2f", ((time.hour * 60) + time.min) / 60.0)
  end
  
  def superior_invalid?
    superior = true
    admin_params.each do |id, item|
      if item[:change_button] == true
        next
      elsif item[:change_button] == false
        superior = false
        break
      end
    end
    return superior
  end
  
end
