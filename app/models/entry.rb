class Entry < ApplicationRecord
  belongs_to :category

  scope :expense_by_month, ->(month) do
    joins("INNER JOIN categories ON entries.category_id = categories.id").
          where("entries.date >= ? and entries.date <= ? AND categories.is_expense=TRUE", 
          month, month.end_of_month)
  end

  class << self
    def total_spent_by_month month
      expense_by_month(month).pluck(:amount).sum
    end

    def total_spent_last_month
      last_month = Date.today.beginning_of_month - 1.month
      total_spent_by_month last_month
    end
  end
end
