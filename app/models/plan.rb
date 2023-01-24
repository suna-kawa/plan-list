class Plan < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  validates :title, length: { maximum: 20 }
  validates :memo,  length: { maximum: 500 }
  validate :start_end_check, 

  def start_end_check
    if self.end_date && self.start_date && self.end_date < self.start_date
      errors.add(:end_date, "は開始日より前の日付で登録できません。")
    end
  end
end

