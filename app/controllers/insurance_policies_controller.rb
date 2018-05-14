# frozen_string_literal: true

class InsurancePoliciesController < ApplicationController
  def index
    handle(run(InsurancePolicy::Index, current_user: current_user)) do |result|
      @insurance_policies = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    handle(run(InsurancePolicy::Create::Present, current_user: current_user))
  end

  def create
    handle(run(InsurancePolicy::Create, current_user: current_user)) do |result|
      return redirect_to insurance_policy_path(result[:model]), notice: 'Insurance Policy successfully created'
    end

    render :new
  end

  def show
    handle(run(InsurancePolicy::Show, current_user: current_user))
  end

  def edit
    handle(run(InsurancePolicy::Update::Present, current_user: current_user))
  end

  def update
    handle(run(InsurancePolicy::Update, current_user: current_user)) do |result|
      return redirect_to insurance_policy_path(result[:model]), notice: 'Insurance Policy successfully updated'
    end

    render :edit
  end

  def destroy
    handle(run(InsurancePolicy::Delete, current_user: current_user)) do
      return redirect_to insurance_policies_path, notice: 'Insurance Policy removed successfully'
    end
  end
end
