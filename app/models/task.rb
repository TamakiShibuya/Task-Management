class Task < ApplicationRecord
  enum priority: {低: 0, 中: 1, 高: 2}
  enum status: {未着手: 0, 作業中: 1, 完了: 2}
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 30 }
  validates :contents, presence: true, length: { maximum: 100 }
  validates :deadline, presence: true
  validate :not_before_today
  validate :validate_name_not_including_comma

  belongs_to :user

  private
  def not_before_today
    errors.add(:deadline, '今日より前の日付は選べません') if deadline < Date.today
  end

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
