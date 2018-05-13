class TrailersController < ApplicationController
  def index
    run Trailer::Index do |result|
      @trailers = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    run Trailer::Create::Present
  end

  def create
    run Trailer::Create do |result|
      return redirect_to trailer_path(result[:model]), notice: "Trailer #{result[:model].reg_number} successfully created"
    end

    render :new
  end

  def show
    run Trailer::Show
  end

  def edit
    run Trailer::Update::Present
  end

  def update
    run Trailer::Update do |result|
      return redirect_to trailer_path(result[:model]), notice: "Trailer #{result[:model].reg_number} successfully updated"
    end

    render :edit
  end

  def destroy
    run Trailer::Delete do |result|
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
