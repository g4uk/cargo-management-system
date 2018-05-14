# frozen_string_literal: true

class CustomersController < ApplicationController
  def index
    handle(run(Customer::Index, current_user: current_user)) do |result|
      @customers = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    handle(run(Customer::Create::Present, current_user: current_user))
  end

  def create
    handle(run(Customer::Create, current_user: current_user)) do |result|
      return redirect_to customer_path(result[:model]), notice: "Customer #{result[:model].first_name} successfully created"
    end

    render :new
  end

  def show
    handle(run(Customer::Show, current_user: current_user))
  end

  def edit
    handle(run(Customer::Update::Present, current_user: current_user))
  end

  def update
    handle(run(Customer::Update, current_user: current_user)) do |result|
      return redirect_to customer_path(result[:model]), notice: "Customer #{result[:model].first_name} successfully updated"
    end

    render :edit
  end

  def destroy
    handle(run(Customer::Delete, current_user: current_user)) do |result|
      return redirect_to customers_path, notice: "Customer #{result[:model].first_name} removed successfully"
    end
  end
end
