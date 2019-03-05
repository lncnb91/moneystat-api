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

      detailed_budget = Budget.by_wallet_month(params[:wallet_id], current_month).map do |budget|
        expected_expense = budget.amount
        spent = budget.category.spent_on_month(current_month)
        {
          category: budget.category.name,
          expected_expense: expected_expense,
          spent: spent,
          available: expected_expense - spent
        }
      end

      spent_expenses = Entry.expense_by_wallet_month(params[:wallet_id], current_month).map do |expense|
        {
          user: expense.user.name,
          date: expense.date.strftime("%Y/%m/%d"),
          category: expense.category.name,
          amount: expense.amount,
          description: expense.description
        }
      end

      dashboard_data = {
        small_box: {
          budget: wallet.total_budget_by_month(current_month),
          total_spent: wallet.total_expense_by_month(current_month),
          wallet_balance: wallet.balance,
          last_month_spent: wallet.total_expense_last_month
        },
        spending_by_user: spending_by_user,
        detailed_budget: detailed_budget,
        spent_expenses: spent_expenses
      }
      render json: dashboard_data
    end
  end
end
