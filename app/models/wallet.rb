class Wallet < ApplicationRecord
  has_many :categories
  has_many :users
end
