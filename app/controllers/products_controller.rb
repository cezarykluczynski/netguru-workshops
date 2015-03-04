class ProductsController < ApplicationController
  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  before_action :authenticate_user!, only: [:update, :create, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
    if not current_user_owns( self.product )
      if request.get?
        flash[:error] = 'You are not allowed to edit this product.'
        return redirect_to action: 'show'
      else
        redirect_to category_product_url(category, product)
      end
    end
  end

  def create
    self.product = Product.new(product_params)

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if not current_user_owns( self.product )
      flash[:error] = 'You are not allowed to edit this product.'
      return redirect_to action: 'show'
    end

    if self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def current_user_owns( product )
    not current_user.nil? and current_user == product.user
  end
end
