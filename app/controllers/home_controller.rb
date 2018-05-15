class HomeController < ApplicationController
  def index
    @user = [Admin.last, CompanyOwner.last, Customer.last, Driver.last]
  end
end
