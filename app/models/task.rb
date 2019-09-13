class Task < ApplicationRecord
  enum priority: {低: 0, 中: 1, 高: 2}
  enum status: {未着手: 0, 作業中: 1, 完了: 2}
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 30 }
  validates :contents, presence: true, length: { maximum: 100 }
  validate :validate_name_not_including_comma

  def self.search(search)
    if search
      Task.where(['name LIKE ?', "%#{search}%"])
    else
      Task.all
    end
  end

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
