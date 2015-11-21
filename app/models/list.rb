# List model
class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  validates :name, presence: true, length: { maximum: 100 }
  validates :user, presence: true
end
