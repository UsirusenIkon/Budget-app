class Group < ApplicationRecord
  belongs_to :user
  has_many :group_accounts
  has_many :accounts, through: :accounts

  validates :icon, :name, presence: true
end
