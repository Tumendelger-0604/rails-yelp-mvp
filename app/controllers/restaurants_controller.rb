class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  # Other controller actions (new, create, edit, update, destroy)...

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end

describe "GET show" do
  it "routes to #show" do
    expect(get: "/restaurants/1").to route_to("restaurants#show", id: "1")
  end


end

describe "GET new" do
  it "routes to #new" do
    expect(get: "/restaurants/new").to route_to("restaurants#new")
  end


end

def show
  @restaurant = Restaurant.find(params[:id])

end

def new
  @restaurant = Restaurant.new

end

describe "POST create" do
  context "with valid params" do
    it "creates a new Restaurant" do
      expect {
        post :create, params: { restaurant: valid_attributes }
      }.to change(Restaurant, :count).by(1)
    end
  end

  context "with invalid params" do
    it "assigns a newly created but unsaved restaurant as @restaurant" do
      post :create, params: { restaurant: invalid_attributes }
      expect(assigns(:restaurant)).to be_a_new(Restaurant)
    end
  end
end

describe "POST create" do
  context "with invalid params" do
    it "assigns a newly created but unsaved review as @review" do
      post :create, params: { restaurant_id: restaurant.id, review: invalid_attributes }
      expect(assigns(:review)).to be_a_new(Review)
    end

  end
end
