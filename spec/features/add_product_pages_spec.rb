require 'rails_helper'
require 'capybara/rails'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Pickle'
    fill_in 'Country of origin', :with => 'Italy'
    fill_in 'Cost', :with => '500'
    click_on 'Create product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Pickle'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Submit'
    expect(page).to have_content 'There was an error. Please try again.'
    expect(page).to have_content 'Name can\'t be blank'
  end
end