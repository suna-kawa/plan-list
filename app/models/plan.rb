class Plan < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  validates :title, length: { maximum: 20 }
  validates :memo,  length: { maximum: 500 }
  validate :start_end_check

  def start_end_check
    if self.end_date < self.start_date
      errors.add(:end_date, "開始日より前の日付を指定する事は出来ません")
    end
  end
end
