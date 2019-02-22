class Category < ApplicationRecord
  has_many :entries
  has_many :budgets

  belongs_to :wallet
end
