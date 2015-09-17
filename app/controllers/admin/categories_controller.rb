class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new()
  end

  def create
    c = Category.new(category_params)
    if c.save 
      redirect_to admin_categories_path
    else
      flash[:errors] = "Must fill in a title"
      redirect_to new_admin_category_path
    end
  end

  def destroy 
    @category = Category.find(params[:id])
    @category.delete
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
