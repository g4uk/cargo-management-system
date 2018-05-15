# frozen_string_literal: true

class DriverPolicy < ApplicationPolicy
  def initialize(user, model)
    @user = user
    @model = model
  end

  def index
    admin? || @user.is_a?(CompanyOwner)
  end

  def create
    admin? || @user.is_a?(CompanyOwner)
  end

  def show
    admin? || @model.id.in?(Driver.where(company_id: @user.companies.ids).ids)
  end

  def update
    admin? || @model.id.in?(Driver.where(company_id: @user.companies.ids).ids)
  end

  def delete
    admin? || @model.id.in?(Driver.where(company_id: @user.companies.ids).ids)
  end

  def take_order
    @user.is_a?(Driver)
  end
end
