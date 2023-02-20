class Group < ApplicationRecord
  belongs_to :user
  has_many :accounts
  

  validates :icon, :name, presence: true
end
