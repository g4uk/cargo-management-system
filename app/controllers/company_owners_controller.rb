# frozen_string_literal: true

class CompanyOwnersController < ApplicationController
  def index
    handle(run(CompanyOwner::Index, current_user: current_user)) do |result|
      @company_owners = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    handle(run(CompanyOwner::Create::Present, current_user: current_user))
  end

  def create
    handle(run(CompanyOwner::Create, current_user: current_user)) do |result|
      return redirect_to company_owner_path(result[:model]),
                         notice: "Company owner #{result[:model].first_name}(#{result[:model].email}) successfully created"
    end

    render :new
  end

  def show
    handle(run(CompanyOwner::Show, current_user: current_user))
  end

  def edit
    handle(run(CompanyOwner::Update::Present, current_user: current_user))
  end

  def update
    handle(run(CompanyOwner::Update, current_user: current_user)) do |result|
      return redirect_to company_owner_path(result[:model]),
                         notice: "Company owner #{result[:model].first_name}(#{result[:model].email}) successfully updated"
    end

    render :edit
  end

  def destroy
    handle(run(CompanyOwner::Delete, current_user: current_user)) do |result|
      return redirect_to company_owners_path,
                         notice: "Company owner #{result[:model].first_name}(#{result[:model].email}) removed successfully"
    end
  end
end
