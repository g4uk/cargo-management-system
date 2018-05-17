class TrailerPolicy < ApplicationPolicy
  def initialize(user, model)
    @user = user
    @model = model
  end

  def index
    admin? || @user.is_a?(CompanyOwner) || @user.is_a?(Driver)
  end

  def create
    admin? || @user.is_a?(CompanyOwner)
  end

  def update
    admin? || (@user.is_a?(CompanyOwner) && @model.company_id.in?(@user.companies.ids)) || (@user.is_a?(Driver) && @model.truck_id == @user.truck.id)
  end

  def show
    admin? || (@user.is_a?(CompanyOwner) && @model.company_id.in?(@user.companies.ids)) || (@user.is_a?(Driver) && @model.truck_id == @user.truck.id)
  end

  def delete
    admin? || (@user.is_a?(CompanyOwner) && @model.company_id.in?(@user.companies.ids))
  end
end
