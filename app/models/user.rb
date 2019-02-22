class User < ApplicationRecord
  has_many :entries

  belongs_to :wallet

  def total_expense_by_month month
    Entry.expense_by_user_month(id, month).pluck(:amount).sum
  end
end
