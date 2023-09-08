class ReviewsController < ApplicationController
  before_action :set_restaurant

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to @restaurant, notice: 'Review was successfully created.'
    else
      render 'restaurants/show'
    end
  end

  # Other controller actions (edit, update, destroy)...

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

describe "GET new" do
  it "routes to #new" do
    expect(get: "/restaurants/1/reviews/new").to route_to("reviews#new", restaurant_id: "1")
  end


end

def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
  # Other code...
end

