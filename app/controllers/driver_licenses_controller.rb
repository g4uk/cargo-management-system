# frozen_string_literal: true

class DriverLicensesController < ApplicationController
  def index
    handle(run(DriverLicense::Index, current_user: current_user)) do |result|
      @driver_licenses = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    handle(run(DriverLicense::Create::Present, current_user: current_user))
  end

  def create
    handle(run(DriverLicense::Create, current_user: current_user)) do |result|
      return redirect_to driver_license_path(result[:model]), notice: 'Driver License successfully created'
    end

    render :new
  end

  def show
    handle(run(DriverLicense::Show, current_user: current_user))
  end

  def edit
    handle(run(DriverLicense::Update::Present, current_user: current_user))
  end

  def update
    handle(run(DriverLicense::Update, current_user: current_user)) do |result|
      return redirect_to driver_license_path(result[:model]), notice: 'Driver Lisence successfully updated'
    end

    render :edit
  end

  def destroy
    handle(run(DriverLicense::Delete, current_user: current_user)) do |_result|
      return redirect_to driver_licenses_path, notice: 'Driver License removed successfully'
    end
  end
end
