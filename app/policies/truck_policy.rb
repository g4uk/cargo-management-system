class TruckPolicy < ApplicationPolicy
  def initialize(user, model)
    @user = user
    @model = model
  end

  def index
    admin? || @user.is_a?(Driver) || @user.is_a?(CompanyOwner)
  end

  def create
    admin? || @user.is_a?(CompanyOwner)
  end

  def show
    admin? || (@user.is_a?(CompanyOwner) && @model.company_id.in?(@user.companies.ids)) || (@user.is_a?(Driver) && @user.id == @model.driver_id)
  end

  def update
    admin? || (@user.is_a?(CompanyOwner) && @model.company_id.in?(@user.companies.ids)) || (@user.is_a?(Driver) && @user.id == @model.driver_id)
  end

  def delete
    admin? || (@user.is_a?(CompanyOwner) && @model.company_id.in?(@user.companies.ids))
  end
end
