class Category < ApplicationRecord
  has_many :entries
  has_many :budgets

  belongs_to :wallet


  def spent_on_month month
    Entry.expend_by_wallet_month_category(month, id).pluck(:amount).sum
  end
end
