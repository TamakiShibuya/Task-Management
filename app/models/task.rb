class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :contents, presence: true, length: { maximum: 100 }
  validate :validate_name_not_including_comma
  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
