class Base < ApplicationRecord
    validates :base_name, presence: true, length: { maximum: 30 }
    
    validates :attendance_typ, presence: true, length: { maximum: 50 }
    
    validates :base_id, presence: true, length: { maximum: 8 }
end


        