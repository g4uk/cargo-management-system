# frozen_string_literal: true

class DriversController < ApplicationController
  def index
    handle(run(Driver::Index, current_user: current_user)) do |result|
      @drivers = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    handle(run(Driver::Create::Present, current_user: current_user))
  end

  def create
    handle(run(Driver::Create, current_user: current_user)) do |result|
      return redirect_to driver_path(result[:model]), notice: "Driver #{result[:model].first_name} successfully created"
    end

    render :new
  end

  def show
    handle(run(Driver::Show, current_user: current_user))
  end

  def edit
    handle(run(Driver::Update::Present, current_user: current_user))
  end

  def update
    handle(run(Driver::Update, current_user: current_user)) do |result|
      return redirect_to driver_path(result[:model]), notice: "Driver #{result[:model].first_name} successfully updated"
    end

    render :edit
  end

  def destroy
    handle(run(Driver::Delete, current_user: current_user)) do |result|
      return redirect_to drivers_path, notice: "Driver #{result[:model].first_name} removed successfully"
    end
  end

  def take_order
    handle(run(Driver::TakeOrder, current_user: current_user)) do
      redirect_to orders_path, notice: 'Order has been taken successfully!'
    end
  end

  def finish_order
    handle(run(Driver::FinishOrder, current_user: current_user)) do
      redirect_to orders_path, notice: 'Order status was changed to completed!'
    end
  end
end
