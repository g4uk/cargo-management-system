# frozen_string_literal: true

class DriverLicensesController < ApplicationController
  def index
    run DriverLicense::Index, current_user: current_user do |result|
      @driver_licenses = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    run DriverLicense::Create::Present
  end

  def create
    run DriverLicense::Create do |result|
      return redirect_to driver_license_path(result[:model]), notice: 'Driver License successfully created'
    end

    render :new
  end

  def show
    run DriverLicense::Show
  end

  def edit
    run DriverLicense::Update::Present
  end

  def update
    run DriverLicense::Update do |result|
      return redirect_to driver_license_path(result[:model]), notice: 'Driver Lisence successfully updated'
    end

    render :edit
  end

  def destroy
    run DriverLicense::Delete do |_result|
      return redirect_to driver_licenses_path, notice: 'Driver License removed successfully'
    end
  end
end
