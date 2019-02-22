class Budget < ApplicationRecord
  belongs_to :category

  scope :by_month_wallet, ->(month, wallet_id) do
    joins(:category).where("budgets.month=month AND categories.wallet_id=wallet_id")
  end

  class << self
    def total_by_month_wallet month, wallet_id
      by_month_wallet(month, wallet_id).pluck(:amount).sum
    end
  end
end
