# frozen_string_literal: true

class GoodsController < ApplicationController
  def index
    handle(run(Good::Index, current_user: current_user)) do |result|
      @goods = search_for(result[:model]).page(params[:page])
    end
  end

  def new
    handle(run(Good::Create::Present, current_user: current_user))
  end

  def create
    handle(run(Good::Create, current_user: current_user)) do |result|
      return redirect_to good_path(result[:model]), notice: "Good #{result[:model].name} successfully created"
    end

    render :new
  end

  def show
    handle(run(Good::Show, current_user: current_user))
  end

  def edit
    handle(run(Good::Update::Present, current_user: current_user))
  end

  def update
    handle(run(Good::Update, current_user: current_user)) do |result|
      return redirect_to good_path(result[:model]), notice: "Good #{result[:model].name} successfully updated"
    end

    render :edit
  end

  def destroy
    handle(run(Good::Delete, current_user: current_user)) do |result|
      return redirect_to goods_path, notice: "Good #{result[:model].name} removed successfully"
    end
  end
end
