class Budget < ApplicationRecord
  class << self
    def total_by_month month
      where(month: month).pluck(:amount).sum
    end
  end
end
