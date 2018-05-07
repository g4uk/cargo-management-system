class CompaniesController < ApplicationController
  def index
    run Company::Index do |result|
      @companies = search_for(result[:model]).page(params[:page])
    end
  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
