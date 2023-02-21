class GroupAccounts < ApplicationRecord
  belongs_to :groups
  belongs_to :accounts
end
