class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PW']
  def show
    @category = Category.count
    @product = Product.count
  end
end
