class User < ApplicationRecord
  has_many :groups
  has_many :accounts

  validates :name, presence: true
end
