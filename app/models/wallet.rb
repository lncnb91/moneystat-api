class Wallet < ApplicationRecord
  has_many :categories
  has_many :users

  def total_expense_by_month month
    Entry.expense_by_wallet_month(id, month).pluck(:amount).sum
  end

  def total_expense_last_month
    last_month = Date.today.beginning_of_month - 1.month
    total_expense_by_month(last_month)
  end

  def total_budget_by_month month
    Budget.by_wallet_month(id, month).pluck(:amount).sum
  end
end
