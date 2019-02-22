class Budget < ApplicationRecord
  belongs_to :category
  
  class << self
    def total_by_month month
      where(month: month).pluck(:amount).sum
    end
  end
end
