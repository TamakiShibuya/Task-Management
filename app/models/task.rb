class Task < ApplicationRecord
  enum priority: {低: 0, 中: 1, 高: 2}, _suffix: true
  enum status: {未着手: 0, 作業中: 1, 完了: 2}, _prefix: :status
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 30 }
  validates :contents, presence: true, length: { maximum: 100 }
  validate :validate_name_not_including_comma

  def self.search(search,status)
    if search.present? && status.present?
      Task.where(['tasks.name LIKE ?', "%#{search}%"]).where(status: [:'未着手', :'作業中', :'完了'])
    elsif search.blank?
      Task.where(status: [:'未着手', :'作業中', :'完了'])
    elsif status.blank?
      Task.where(['tasks.name LIKE ?', "%#{search}%"])
    end
  end

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
