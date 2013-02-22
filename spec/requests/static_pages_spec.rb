require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Test App'" do
      visit '/static_pages/home'
      page.should have_content('Test App')
    end
  end

  describe "Data page" do

    it "should have the content 'Data'" do
      visit '/static_pages/data'
      page.should have_content('Data')
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end
  end
end