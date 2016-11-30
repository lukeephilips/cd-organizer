require('capybara/rspec')
require('./app')
require('cd')
require('artists')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('takes user to target route', {:type=>:feature}) do
  it('the route will take user to cd creation form') do
    visit('/')
    expect(page).to have_content("Create a new artist category")
  end
  it('the route will take user to cd creation form') do
    visit('/')
    click_link('Create a new artist category')
    expect(page).to have_content("Enter a new artist name")
  end

  
  # it('the route will take user to cd list') do
  #   visit('/')
  #   click_link('Create new CD')
  #   fill_in('artist', :with => "Snoop Dogg")
  #   fill_in('album', :with => "Doggystyle")
  #   click_button('Submit')
  #   expect(page).to have_content("Success! You added a CD")
  # end
  # it('the route will take user to cd list') do
  #   visit('/')
  #   click_link('Create new CD')
  #   fill_in('artist', :with => "Snoop Dogg")
  #   fill_in('album', :with => "Doggystyle")
  #   click_button('Submit')
  #   expect(page).to have_content("Success! You added a CD")
  #   click_link('View all CDs')
  #   expect(page).to have_content("Snoop Dogg")
  # end
end
