require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_length_of(:password).is_at_least(8) }

  it 'is valid with email downcase' do
    expect(FactoryGirl.build(:user, email: 'test@test.pl')).to be_valid
  end

  it 'is saved with email to downcase' do
    test_user = FactoryGirl.create(:user, email: 'Test@TEST.PL')

    expect(test_user.email).to eq('test@test.pl')
    expect(test_user.email).not_to eq('Test@TEST.PL')
  end

  it 'is valid with email' do
    valid_addresses = %w(janek@mailinator.com TEST-TEST@mailinator.com.pl janek.franek@mailinator.com janek+franek@m.pl)
    valid_addresses.each do |email|
      expect(FactoryGirl.build(:user, email: email)).to be_valid
    end
  end

  it 'is invalid with email' do
    invalid_addresses = %w(janek@.com TEST-TESTmailinator.com.pl janek.@franek@mailinator.com janek:franek@m.pl)
    invalid_addresses.each do |email|
      expect(FactoryGirl.build(:user, email: email)).not_to be_valid, "#{email.inspect} should be invalid"
    end
  end
end
