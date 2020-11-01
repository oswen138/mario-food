require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Pickle'
    fill_in 'Country of origin', :with => 'Italy'
    fill_in 'Cost', :with => '500'
    click_button 'Submit'
    click_on 'Add a new review'
    fill_in 'Author', :with => 'Kingsley'
    fill_in 'Rating', :with => '3.5'
    fill_in 'Content body', :with => 'Very sour'
    click_on 'Create Review'
    expect(page).to have_content 'Kingsley'
  end

  it "gives an error when no name is entered" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Pickle'
    fill_in 'Country of origin', :with => 'Italy'
    fill_in 'Cost', :with => '500'
    click_button 'Submit'
    expect(page).to have_content 'There was an error. Please try again.'
    expect(page).to have_content 'Title can\'t be blank'
  end
end

