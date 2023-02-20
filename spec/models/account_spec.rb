require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:user1) do
    User.create(
      name: 'Tom'
    )
  end

  let(:account) do
    Account.create(
      user: user1,
      name: 'savings',
      ammount: 50
    )
  end

  it 'The user should be present' do
    account.user = nil
    expect(account).to_not be_valid
  end

  it 'name must not be blank' do
    account.name = nil
    expect(account).to_not be_valid
  end

  it 'ammount must be an integer' do
    account.ammount = nil
    expect(account).to_not be_valid
  end
end
