require('capybara/rspec')
require('./app.rb')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the stylist path', {:type =>:feature}) do
  it ('shows a list of stylists') do
    visit('/')
    click_on('View all Stylists')
    expect(page).to have_content('EpiSalon Stylists')
  end
end

describe('the client path', {:type => :feature}) do
  it('shows a list of clients') do
    visit('/')
    click_on('View all Clients')
    expect(page).to have_content('EpiSalon Clients')
  end
end
