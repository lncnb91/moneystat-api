class Entry < ApplicationRecord
  belongs_to :category

  delegate :wallet, to: :category, allow_nil: true

  scope :expense_by_wallet_month, ->(wallet_id, month) do
    joins(:category).where("entries.date >= ? and entries.date <= ? AND 
      categories.is_expense = TRUE AND categories.wallet_id = ?", 
          month, month.end_of_month, wallet_id)
  end

  scope :expense_by_wallet_month_user, ->(wallet_id, month, user_id) do
    expense_by_wallet_month(wallet_id, month).where("entries.user_id = ?", user_id)
  end

  class << self
    def total_expense_by_wallet_month wallet_id, month
      expense_by_wallet_month(wallet_id, month).pluck(:amount).sum
    end

    def total_expense_by_wallet_month_user wallet_id, month, user_id
      expense_by_wallet_month_user(wallet_id, month, user_id).pluck(:amount).sum
    end

    def total_expense_wallet_last_month
      last_month = Date.today.beginning_of_month - 1.month
      total_spent_by_wallet_month(wallet_id, last_month)
    end
  end
end
