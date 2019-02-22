module Api::V1
  class DashboardsController < ApplicationController
    def index
      current_month = Date.today.beginning_of_month
      wallet = Wallet.find(params[:wallet_id])
      spending_by_user = wallet.users.map do |user| 
        {
          user_name: user.name,
          spent_amount: user.total_expense_by_month(current_month)
        }
      end
      small_box_data = {
        budget: wallet.total_budget_by_month(current_month),
        total_spent: wallet.total_expense_by_month(current_month),
        balance: wallet.balance,
        last_month_spent: wallet.total_expense_last_month,
        spending_by_user: spending_by_user
      }
      render json: small_box_data
    end
  end
end
