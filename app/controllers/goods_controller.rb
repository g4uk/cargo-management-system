class GoodsController < ApplicationController
  def index
    run Good::Index do |result|
      @goods = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    run Good::Create::Present
  end

  def create
    run Good::Create do |result|
      return redirect_to good_path(result[:model]), notice: "Good #{result[:model].name} successfully created"
    end

    render :new
  end

  def show
    run Good::Show
  end

  def edit
    run Good::Update::Present
  end

  def update
    run Good::Update do |result|
      return redirect_to good_path(result[:model]), notice: "Good #{result[:model].name} successfully updated"
    end

    render :edit
  end

  def destroy
    run Good::Delete do |result|
      return redirect_to goods_path, notice: "Good #{result[:model].name} removed successfully"
    end
  end
end
