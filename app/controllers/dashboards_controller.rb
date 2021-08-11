class DashboardsController < ApplicationController
  def index
    @role = Current.user.role
  end
end
