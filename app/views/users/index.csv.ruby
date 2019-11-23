require 'csv'

CSV.generate do |csv|
  column_names = %w(worked_on started_at finished_at)
  csv << column_names
  @users.each do |user|
    user.attendances.each do |a|
        @start = ""
        
        @start = l(a.started_at, format: :time) if a.started_at.present?  
          
        
         @finish = ""
         @finish = l(a.finished_at, format: :time) if a.finished_at.present?      
      
      column_values = [
        a.worked_on,
        @start,
        @finish
      ]
      csv << column_values
    end
  end
end