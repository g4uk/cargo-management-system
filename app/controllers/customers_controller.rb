class CustomersController < ApplicationController
  def index
    run Customer::Index do |result|
      @customers = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    run Customer::Create::Present
  end

  def create
    run Customer::Create do |result|
      return redirect_to customer_path(result[:model]), notice: "Customer #{result[:model].first_name} successfully created"
    end

    render :new
  end

  def show
    run Customer::Show
  end

  def edit
    run Customer::Update::Present
  end

  def update
    run Customer::Update do |result|
      return redirect_to customer_path(result[:model]), notice: "Customer #{result[:model].first_name} successfully updated"
    end

    render :edit
  end

  def destroy
    run Customer::Delete do |result|
      return redirect_to customers_path, notice: "Customer #{result[:model].first_name} removed successfully"
    end
  end
end
