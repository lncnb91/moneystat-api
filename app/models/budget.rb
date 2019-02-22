class Budget < ApplicationRecord
  belongs_to :category

  scope :by_wallet_month, ->(wallet_id, month) do
    joins(:category).where("budgets.month = month AND categories.wallet_id = wallet_id AND categories.is_expense = TRUE")
  end
end
