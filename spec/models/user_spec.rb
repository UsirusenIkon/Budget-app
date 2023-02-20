require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) do
    User.create(
      name: 'Tom'
    )
  end

  it 'The user should be present' do
    user1.name = nil
    expect(user1).to_not be_valid
  end
end
