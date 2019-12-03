require 'csv'

CSV.generate do |csv|
  column_names = %w(worked_on started_at finished_at)
  csv << column_names
    @user.attendances.each do |a|
        @start = ""
        
        @start = l(a.started_at, format: :time) if a.started_at.present?  
          
        
         @finish = ""
         
         @finish = l(a.finished_at, format: :time) if a.finished_at.present?   
         
         @worked_on = ""
         
         @worked_on = a.worked_on
         
      
      column_values = [
        @worked_on,
        @start,
        @finish
      ]
      csv << column_values
    end
end