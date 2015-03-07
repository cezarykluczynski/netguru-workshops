class ProfileController < ApplicationController
  expose (:reviews) {
    current_user.reviews.order("created_at DESC").limit(5)
  }

  expose (:products) {
    current_user.products.order("created_at DESC").limit(5)
  }

  def show


  end
end
