require 'rails_helper'

RSpec.describe List, type: :model do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(100) }
  it { should validate_uniqueness_of(:slug) }
end
