require 'rails_helper'

RSpec.describe "ShoppingCarts", :type => :request do
  describe "GET /shopping_carts" do
    it "works! (now write some real specs)" do
      get shopping_carts_path
      expect(response.status).to be(200)
    end
  end
end
