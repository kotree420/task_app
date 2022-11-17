class Schedule < ApplicationRecord
  validate :check_date

  def check_date
    if start_date < Date.today
      errors.add(:start_date, "に過去日は指定できません")
    elsif end_date < Date.today
      errors.add(:end_date, "に過去日は指定できません")
    elsif end_date < start_date
      errors.add(:end_date, "に開始日より前の日は指定できません")
    end
  end
end

