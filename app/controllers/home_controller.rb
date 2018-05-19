class HomeController < ApplicationController
  def index
    @user = [Admin.first, CompanyOwner.first, Customer.first, Driver.first]
  end
end
