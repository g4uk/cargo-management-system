class OrdersController < ApplicationController
  def index
    run Order::Index do |result|
      @orders = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    run Order::Create::Present
  end

  def create
    run Order::Create do |result|
      return redirect_to order_path(result[:model]), notice: "Order successfully created"
    end

    render :new
  end

  def show
    run Order::Show
  end

  def edit
    run Order::Update::Present
  end

  def update
    run Order::Update do |result|
      return redirect_to order_path(result[:model]), notice: "Order successfully updated"
    end

    render :edit
  end

  def destroy
    run Order::Delete do |result|
      return redirect_to orders_path, notice: "Order removed successfully"
    end
  end
end
