class Attendance < ApplicationRecord
  belongs_to :user

  validates :worked_on, presence: true
  validates :note, length: { maximum: 50 }
 
  # 出勤時間が存在しない場合、退勤時間は無効
  validate :finished_at_is_invalid_without_a_started_at
  # 出勤・退勤時間どちらも存在する時、出勤時間より早い退勤時間は無効
  validate :started_at_than_finished_at_fast_if_invalid

  def finished_at_is_invalid_without_a_started_at
    errors.add(:started_at, "が必要です") if started_at.blank? && finished_at.present?
  end

  def started_at_than_finished_at_fast_if_invalid
    if started_at.present? && finished_at.present?
      errors.add(:started_at, "より早い退勤時間は無効です") if started_at > finished_at
    end
  end
  
  def self.attendance_update(admin_params)
    admin_params.to_h.map do |id, admin_params|
      superior = self.find(id)
      superior.update_attributes!(admin_params)
    end
  end
  
  def self.one_month_up(one_month_application_params)
    one_month_application_params.to_h.map do |id, one_month_application_params|
      one_month = self.find(id)
      one_month.update_attributes!(one_month_application_params)
    end
  end
  
  def self.admin_modal_one_up(admin_one_params)
    admin_one_params.to_h.map do |id, admin_one_params|
      admin_one = self.find(id)
      admin_one.update_attributes!(admin_one_params)
    end
  end
  
  def self.edit_superior_d(edit_params)
    edit_params.to_h.map do |id, edit_params|
      edit_superior = self.find(id)
      edit_superior.update_attributes!(edit_params)
    end
  end
  
end