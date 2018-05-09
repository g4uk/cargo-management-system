class CompaniesController < ApplicationController
  def index
    run Company::Index do |result|
      @companies = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    run Company::Create::Present
  end

  def create
    run Company::Create do |result|
      return redirect_to company_path(result[:model]), notice: "Company #{result[:model].name} successfully created"
    end

    render :new
  end

  def show
    run Company::Show
  end

  def edit
    run Company::Update::Present
  end

  def update
    run Company::Update do |result|
      return redirect_to company_path(result[:model]), notice: "Company #{result[:model].name} successfully updated"
    end

    render :edit
  end

  def destroy
    run Company::Delete do |result|
      return redirect_to companies_path, notice: "Company #{result[:model].name} removed successfully"
    end
  end
end
