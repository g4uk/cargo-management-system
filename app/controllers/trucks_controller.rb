class TrucksController < ApplicationController
  def index
    run Truck::Index do |result|
      @trucks = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    run Truck::Create::Present
  end

  def create
    run Truck::Create do |result|
      return redirect_to truck_path(result[:model]), notice: "Truck #{result[:model].reg_number} successfully created"
    end

    render :new
  end

  def show
    run Truck::Show
  end

  def edit
    run Truck::Update::Present
  end

  def update
    run Truck::Update do |result|
      return redirect_to truck_path(result[:model]), notice: "Truck #{result[:model].reg_number} successfully updated"
    end

    render :edit
  end

  def destroy
    run Truck::Delete do |result|
      return redirect_to trucks_path, notice: "Truck #{result[:model].reg_number} removed successfully"
    end
  end
end
