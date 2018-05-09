# frozen_string_literal: true

class CompanyOwnersController < ApplicationController
  def index
    run CompanyOwner::Index do |result|
      @company_owners = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    run CompanyOwner::Create::Present
  end

  def create
    run CompanyOwner::Create do |result|
      return redirect_to company_owner_path(result[:model]),
                         notice: "Company owner #{result[:model].first_name}(#{result[:model].email}) successfully created"
    end

    render :new
  end

  def show
    run CompanyOwner::Show
  end

  def edit
    run CompanyOwner::Update::Present
  end

  def update
    run CompanyOwner::Update do |result|
      return redirect_to company_owner_path(result[:model]),
                         notice: "Company owner #{result[:model].first_name}(#{result[:model].email}) successfully updated"
    end

    render :edit
  end

  def destroy
    run CompanyOwner::Delete do |result|
      return redirect_to company_owners_path,
                         notice: "Company owner #{result[:model].first_name}(#{result[:model].email}) removed successfully"
    end
  end
end
