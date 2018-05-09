module Search
  def search_for(scope)
    @search = scope.ransack(params[:q])
    @search.result
  end
end

