# frozen_string_literal: true

class TrucksController < ApplicationController
  def index
    handle(run(Truck::Index, current_user: current_user)) do |result|
      @trucks = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    handle(run(Truck::Create::Present, current_user: current_user))
  end

  def create
    handle(run(Truck::Create, current_user: current_user)) do |result|
      return redirect_to truck_path(result[:model]), notice: "Truck #{result[:model].reg_number} successfully created"
    end

    render :new
  end

  def show
    handle(run(Truck::Show, current_user: current_user))
  end

  def edit
    handle(run(Truck::Update::Present, current_user: current_user))
  end

  def update
    handle(run(Truck::Update, current_user: current_user)) do |result|
      return redirect_to truck_path(result[:model]), notice: "Truck #{result[:model].reg_number} successfully updated"
    end

    render :edit
  end

  def destroy
    handle(run(Truck::Delete, current_user: current_user)) do |result|
      return redirect_to trucks_path, notice: "Truck #{result[:model].reg_number} removed successfully"
    end
  end

  def driver_select
    if params[:selected_company_id].present?
      drivers = Company.find(params[:selected_company_id]).drivers
    end
    respond_to do |format|
      format.json { render json: drivers }
      format.html
    end
  end
end
