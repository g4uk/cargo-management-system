class CompanyOwnerPolicy < ApplicationPolicy
  def initialize(user, _model)
    @user = user
  end
end
