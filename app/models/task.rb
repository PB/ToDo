# Task model
class Task < ActiveRecord::Base
  default_scope { order(id: :asc) }

  belongs_to :list

  validates :name, presence: true, length: { maximum: 255 }
  validates :list, presence: true
  validates :status, inclusion: [true, false]
end
