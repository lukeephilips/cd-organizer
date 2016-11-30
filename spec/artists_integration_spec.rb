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
  it('the route will take user to artist list') do
    visit('/')
    click_link('Create a new artist category')
    fill_in('name', :with => "Snoop Dogg")
    click_button('Submit')
    expect(page).to have_content("Snoop Dogg")
  end
  it('the route will take user to cd list') do
    visit('/')
    Artist.clear()
    click_link('Create a new artist category')
    fill_in('name', :with => "Snoop Dogg")
    click_button('Submit')
    expect(page).to have_content("Snoop Dogg")
    click_link('Snoop Dogg')
    expect(page).to have_content("Here is a list")
  end
  it('the route will take user to cd form') do
    visit('/')
    Artist.clear()
    click_link('Create a new artist category')
    fill_in('name', :with => "Snoop Dogg")
    click_button('Submit')
    expect(page).to have_content("Snoop Dogg")
    click_link('Snoop Dogg')
    expect(page).to have_content("Here is a list")
    click_link('Add new album')
    expect(page).to have_content("Enter your new")
  end
  it('the route will register CD within artist cd list') do
    visit('/')
    Artist.clear()
    click_link('Create a new artist category')
    fill_in('name', :with => "Snoop Dogg")
    click_button('Submit')
    expect(page).to have_content("Snoop Dogg")
    click_link('Snoop Dogg')
    expect(page).to have_content("Here is a list")
    click_link('Add new album')
    expect(page).to have_content("Enter your new")
    fill_in('album', :with => 'Doggystyle')
    click_button('Submit')
    expect(page).to have_content("Doggystyle")
  end
end
