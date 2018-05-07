module Search
  def search_for(model)
    @search = model.ransack(params[:q]).result
  end
end
