class CompanyPolicy < ApplicationPolicy
  def initialize(user, model)
    @user = user
    @model = model
  end

  def index
    true if admin? || @user.is_a?(CompanyOwner)
  end

  def show
    return true if admin?
    return true if @user.is_a(CompanyOwner) && @model.company_owner_id == @user.id
    return true if @user.is_a?(Driver) && @model.id == @user.company_id
    false
  end

  def create
    true if admin? || @user.is_a?(CompanyOwner)
  end

  def update
    return true if admin?
    return true if @user.is_a?(CompanyOwner) && @model.company_owner_id == @user.id
    false
  end

  def delete
    true if admin? || (@user.class == CompanyOwner && @model.company_owner_id == @user.id)
  end
end
