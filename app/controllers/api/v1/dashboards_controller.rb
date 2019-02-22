module Api::V1
  class DashboardsController < ApplicationController
    def index
      requested_month = Date.parse(params[:month].to_s)
      small_box_data = {
        budget: Budget.total_by_month(requested_month, wallet),
        total_spent: Entry.total_spent_by_month(requested_month),
        
      }
      render json: small_box_data
    end
  end
end
