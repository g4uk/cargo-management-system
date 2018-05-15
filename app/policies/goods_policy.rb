class GoodsPolicy < ApplicationPolicy
  def initialize(user, model)
    @user = user
    @model = model
  end

  def index
    admin? || @user.class.in?([Customer, CompanyOwner])
  end

  def create
    admin? || @user.is_a?(Customer)
  end

  def show
    admin? || @model.customer_id == @user.id && @user.is_a?(Customer) || @user.is_a?(CompanyOwner)
  end

  def update
    admin? || @model.customer_id == @user.id && @user.is_a?(Customer)
  end

  def delete
    admin? || @model.customer_id == @user.id && @user.is_a?(Customer)
  end
end
