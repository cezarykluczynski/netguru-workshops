class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :price, :description, :title, presence: true
  validates_format_of :price, :with => /\A\d+(?:\.\d{0,2})?\z/

  def average_rating
    rating = 0
    reviews_count = 0

    self.reviews.each { |review|
      reviews_count += 1
      rating += review.rating
    }

    reviews_count ? rating.fdiv( reviews_count ) : 0
  end
end
