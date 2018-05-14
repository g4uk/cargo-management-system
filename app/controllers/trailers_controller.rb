# frozen_string_literal: true

class TrailersController < ApplicationController
  def index
    handle(run(Trailer::Index, current_user: current_user)) do |result|
      @trailers = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    handle(run(Trailer::Create::Present, current_user: current_user))
  end

  def create
    handle(run(Trailer::Create, current_user: current_user)) do |result|
      return redirect_to trailer_path(result[:model]), notice: "Trailer #{result[:model].reg_number} successfully created"
    end

    render :new
  end

  def show
    handle(run(Trailer::Show, current_user: current_user))
  end

  def edit
    handle(run(Trailer::Update::Present, current_user: current_user))
  end

  def update
    handle(run(Trailer::Update, current_user: current_user)) do |result|
      return redirect_to trailer_path(result[:model]), notice: "Trailer #{result[:model].reg_number} successfully updated"
    end

    render :edit
  end

  def destroy
    handle(run(Trailer::Delete, current_user: current_user)) do |result|
      return redirect_to trailers_path, notice: "Trailer #{result[:model].reg_number} removed successfully"
    end
  end

  def truck_select
    if params[:selected_company_id].present?
      trucks = Company.find(params[:selected_company_id]).trucks
    end
    respond_to do |format|
      format.json { render json: trucks }
      format.html
    end
  end
end
