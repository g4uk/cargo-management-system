class OrderPolicy < ApplicationPolicy
  def initialize(user, model)
    @user = user
    @model = model
  end

  def index
    admin? || @user.class.in?([Driver, CompanyOwner, Customer])
  end

  def create
    admin? || @user.is_a?(Customer)
  end

  def show
    admin? || @user.is_a?(Customer) && @model.customer_id == @user_id
    return true if @user.is_a?(Driver) && @model.driver_id == @user.id
    @user.is_a?(CompanyOwner)
  end

  def update
    admin? || @user.is_a?(Customer) && @model.customer_id == @user_id
  end

  def delete
    admin? || @user.is_a?(Customer) && @model.customer_id == @user_id
  end

  def assign_driver
    admin? || @user.is_a?(Customer) && @model.customer_id == @user_id
  end
end
