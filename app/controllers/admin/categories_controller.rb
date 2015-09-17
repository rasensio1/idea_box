class Admin::CategoriesController < Admin::BaseController

  def index
    render text: "Categories ADMIN ONLY"
  end

end
