require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of(:list) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(255) }
  it { should validate_inclusion_of(:status).in_array([true, false]) }
end
