require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user1) do
    User.create(
      name: 'Tom'
    )
  end

  let(:group) do
    Group.create(
      user: user1,
      name: 'ballers',
      icon: 'www.pngicon'
    )
  end

  it 'The user should be present' do
    group.user = nil
    expect(group).to_not be_valid
  end

  it 'name must not be blank' do
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'ammount must be an integer' do
    group.icon = nil
    expect(group).to_not be_valid
  end
end
