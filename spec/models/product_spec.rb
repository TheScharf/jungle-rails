require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.create(name: "stationary")
  end

  describe 'Validations' do
    it "saves a product" do
      @product = @category.products.new(name: "pen", price: 67, quantity: 8)
      expect(@product).to be_valid
    end
    it "errors when no name entered" do
      @product = @category.products.create(name: nil, price: 58, quantity: 3)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "errors when no price entered" do
      @product = @category.products.create(name: "stapler", quantity: 5)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "errors when no quantity entered" do
      @product = @category.products.create(name: "journal", price: 75)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "errors when there is no category" do
      @product = Product.create(name: "pencil", price: 86, quantity: 258)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
