class Group < ApplicationRecord
  belongs_to :user
  has_many :group_accounts
  has_many :accounts, through: :group_accounts

  validates :icon, :name, presence: true
end
