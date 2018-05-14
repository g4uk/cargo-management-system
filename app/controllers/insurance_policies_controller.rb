class InsurancePoliciesController < ApplicationController
  def index
    run InsurancePolicy::Index, current_user: current_user do |result|
      @insurance_policies = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    run InsurancePolicy::Create::Present
  end

  def create
    run InsurancePolicy::Create do |result|
      return redirect_to insurance_policy_path(result[:model]), notice: "Insurance Policy successfully created"
    end

    render :new
  end

  def show
    run InsurancePolicy::Show
  end

  def edit
    run InsurancePolicy::Update::Present
  end

  def update
    run InsurancePolicy::Update do |result|
      return redirect_to insurance_policy_path(result[:model]), notice: "Insurance Policy successfully updated"
    end

    render :edit
  end

  def destroy
    run InsurancePolicy::Delete do |result|
      return redirect_to insurance_policies_path, notice: "Insurance Policy removed successfully"
    end
  end
end
