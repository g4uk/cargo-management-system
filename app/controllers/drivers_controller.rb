class DriversController < ApplicationController
  def index
    run Driver::Index do |result|
      @drivers = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    run Driver::Create::Present
  end

  def create
    run Driver::Create do |result|
      return redirect_to driver_path(result[:model]), notice: "Driver #{result[:model].first_name} successfully created"
    end

    render :new
  end

  def show
    run Driver::Show
  end

  def edit
    run Driver::Update::Present
  end

  def update
    run Driver::Update do |result|
      return redirect_to driver_path(result[:model]), notice: "Driver #{result[:model].first_name} successfully updated"
    end

    render :edit
  end

  def destroy
    run Driver::Delete do |result|
      return redirect_to dirvers_path, notice: "Driver #{result[:model].first_name} removed successfully"
    end
  end
end
