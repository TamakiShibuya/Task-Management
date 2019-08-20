class Task < ApplicationRecord
  scope :recent, -> { order(deadline: :desc) }
end
