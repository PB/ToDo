# List model
class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  before_create :make_slug

  validates :name, presence: true, length: { maximum: 100 }
  validates :user, presence: true
  validates :slug, uniqueness: true

  def make_slug
    self.slug = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
  end
end
