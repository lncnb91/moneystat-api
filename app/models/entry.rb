class Entry < ApplicationRecord
  belongs_to :category
  belongs_to :user

  delegate :wallet, to: :category, allow_nil: true

  scope :expense_by_wallet_month, ->(wallet_id, month) do
    joins(:category).where("entries.date >= ? and entries.date <= ? AND 
      categories.is_expense = TRUE AND categories.wallet_id = ?", 
          month, month.end_of_month, wallet_id)
  end

  scope :expend_by_wallet_month_category, ->(month, category_id) do #category belongs to wallet so no need wallet_id
    joins(:category).where("entries.date >= ? and entries.date <= ? AND 
      categories.is_expense = TRUE AND categories.id = ?", 
          month, month.end_of_month, category_id)
  end

  scope :expense_by_user_month, ->(user_id, month) do
    wallet_id = User.find(user_id).wallet_id
    expense_by_wallet_month(wallet_id, month).where("entries.user_id = ?", user_id)
  end
end
