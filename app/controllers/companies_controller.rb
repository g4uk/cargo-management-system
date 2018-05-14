# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    handle(run(Company::Index, current_user: current_user)) do |result|
      @companies = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    handle(run(Company::Create::Present, current_user: current_user))
  end

  def create
    handle(run(Company::Create, current_user: current_user)) do |result|
      return redirect_to company_path(result[:model]), notice: "Company #{result[:model].name} successfully created"
    end

    render :new
  end

  def show
    handle(run(Company::Show, current_user: current_user))
  end

  def edit
    handle(run(Company::Update::Present, current_user: current_user))
  end

  def update
    handle(run(Company::Update, current_user: current_user)) do |result|
      return redirect_to company_path(result[:model]), notice: "Company #{result[:model].name} successfully updated"
    end

    render :edit
  end

  def destroy
    handle(run(Company::Delete, current_user: current_user)) do |result|
      return redirect_to companies_path, notice: "Company #{result[:model].name} removed successfully"
    end
  end
end
