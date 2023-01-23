class Plan < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  validates :title, length: { maximum: 20 }
  validates :memo,  length: { maximum: 500 }
  validate :start_end_check

  def start_end_check
    if :end_date < :start_date
      errors.add(:end_date, "は開始日より後の日付でないと登録出来ません")
    end
  end
end
