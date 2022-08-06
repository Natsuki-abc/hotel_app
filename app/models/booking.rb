class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :register

    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :person, presence: true

    validate :date_before_start
    validate :start_end_check

    def date_before_start
        return if start_date.blank?
        errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today
    end

    def start_end_check
        if self.end_date < self.start_date
            errors.add(:end_date, "は開始日より前の日付は登録できません")
        end
    end
end
