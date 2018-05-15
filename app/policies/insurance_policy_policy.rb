class InsurancePolicyPolicy < ApplicationPolicy
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
    @user.is_a?(CompanyOwner) && @model.driver_id.in?(Driver.where(company_id: @user.companies.ids).ids)
  end

  def update
    return true if admin?
    return true if @user.is_a?(Driver) && @model.driver_id == @user.id
    @user.is_a?(CompanyOwner) && @model.driver_id.in?(Driver.where(company_id: @user.companies.ids).ids)
  end

  def delete
    return true if admin?
    return true if @user.is_a?(Driver) && @model.driver_id == @user.id
    @user.is_a?(CompanyOwner) && @model.driver_id.in?(Driver.where(company_id: @user.companies.ids).ids)
  end
end
