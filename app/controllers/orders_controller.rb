# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    handle(run(Order::Index, current_user: current_user)) do |result|
      @orders = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    handle(run(Order::Create::Present, current_user: current_user))
  end

  def create
    handle(run(Order::Create, current_user: current_user)) do |result|
      return redirect_to order_path(result[:model]), notice: 'Order successfully created'
    end

    render :new
  end

  def show
    handle(run(Order::Show, current_user: current_user))
  end

  def edit
    handle(run(Order::Update::Present, current_user: current_user))
  end

  def update
    handle(run(Order::Update, current_user: current_user)) do |result|
      return redirect_to order_path(result[:model]), notice: 'Order successfully updated'
    end

    render :edit
  end

  def destroy
    handle(run(Order::Delete, current_user: current_user)) do
      return redirect_to orders_path, notice: 'Order removed successfully'
    end
  end

  def new_driver_assignment
    handle(run(Order::AssignDriver::Present, current_user: current_user))
  end

  def assign_driver
    handle(run(Order::AssignDriver, current_user: current_user)) do
      return redirect_to orders_path, notice: 'Driver was assigned successfully'
    end

    render :new_driver_assignment
  end
end
