module Api::V1
  class DashboardsController < ApplicationController
    STATSTIC_MONTHS_EARLIEST = 6
    STATSTIC_MONTHS_LATEST = 1

    def index
      current_month = Date.today.beginning_of_month
      wallet = Wallet.find(params[:wallet_id])

      spending_by_user = wallet.users.map do |user| 
        {
          user_name: user.name,
          spent_amount: user.total_expense_by_month(current_month)
        }
      end

      detailed_budgets = Budget.by_wallet_month(params[:wallet_id], current_month).map do |budget|
        expected_expense = budget.amount
        spent = budget.category.spent_on_month(current_month)
        {
          id: budget.id,
          category: budget.category.name,
          description: budget.category.description,
          expected_expense: expected_expense,
          spent: spent,
          available: expected_expense - spent
        }
      end

      spent_expenses = Entry.expense_by_wallet_month(params[:wallet_id], current_month).map do |expense|
        {
          id: expense.id,
          user: expense.user.name,
          date: expense.date.strftime("%Y/%m/%d"),
          category: expense.category.name,
          amount: expense.amount,
          description: expense.description
        }
      end

      monthly_spending = STATSTIC_MONTHS_EARLIEST.downto(STATSTIC_MONTHS_LATEST).map do |i|
        month = current_month - i.months
        month_by_int = month.month
        {
          month: I18n.t("date.abbr_month_names")[month_by_int],
          total_expense: wallet.total_expense_by_month(month)
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
        detailed_budgets: detailed_budgets,
        spent_expenses: spent_expenses,
        monthly_spending: monthly_spending
      }
      render json: dashboard_data
    end
  end
end
