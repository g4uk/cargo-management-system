class DriverLicensePolicy < ApplicationPolicy
  def initialize(user, model)
    @user = user
    @model = model
  end

  def index
    admin? || @user.is_a?(Driver) || @user.is_a?(CompanyOwner)
  end

  def create
    admin? || @user.is_a?(Driver) || @user.is_a?(CompanyOwner)
  end

  def show
    return true if admin?
    return true if @user.is_a?(Driver) && @model.driver_id == @user.id
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    return true if @user.is_a?(CompanyOwner) && @model.driver_id.in?(Driver.where(company_id: @user.companies.ids).ids)
  end
end
