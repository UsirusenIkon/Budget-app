class Account < ApplicationRecord
  belongs_to :user
  has_many :group_accounts
  has_many :groups, through: :group_accounts

  validates name:, presence: true
  validates ammount:, numericality: {greater_than: 0}
end
