require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
end

describe Product do
  it("titleizes the name of an product") do
    product = Product.create({name: "broccoli", country_of_origin: "italy", cost: 500})
    expect(product.name()).to(eq("Broccoli"))
  end
end