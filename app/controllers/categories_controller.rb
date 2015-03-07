class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :authenticate_user!, :redirect_non_admins_to_login

  expose(:categories)
  expose(:category)
  expose(:products) { category.products }
  expose(:product) { Product.new }

  def redirect_non_admins_to_login
    if action_name != "index" and action_name != "show" and ( not current_user.admin? and not current_user.admin )
      redirect_to :controller => "devise/sessions", :action => :new
    end
  end

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.category = Category.new(category_params)

    if category.save
      redirect_to category, notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if category.update(category_params)
      redirect_to category, notice: 'Category was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
