# Task model
class Task < ActiveRecord::Base
  belongs_to :list
  # todo default order
  validates :name, presence: true, length: { maximum: 255 }
  validates :list, presence: true
  validates :status, inclusion: [true, false]
end
