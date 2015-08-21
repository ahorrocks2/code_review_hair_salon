require('capybara/rspec')
require('./app.rb')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the stylist path', {:type =>:feature}) do
  it('shows a list of stylists') do
    visit('/')
    click_on('View all Stylists')
    expect(page).to have_content('EpiSalon Stylists')
  end

  it('allows owner to add a stylist') do
    visit('/stylists')
    fill_in("stylist_name", :with => "Eowyn")
    click_button('Add Stylist')
    expect(page).to have_content("Eowyn")
  end

  it('allows owner to see clients of a single stylist') do
    visit('/stylists')
    fill_in("stylist_name", :with => "Eowyn")
    click_button('Add Stylist')
    click_link('Eowyn')
    expect(page).to have_content("Clients of Eowyn")
  end
end

describe('the client path', {:type => :feature}) do
  it('shows a list of clients') do
    visit('/')
    click_on('View all Clients')
    expect(page).to have_content('EpiSalon Clients')
  end

  it('allows owner to add a client') do
    visit('/stylists')
    fill_in('stylist_name', :with => 'Samwise')
    click_button('Add Stylist')
    visit('/clients')
    fill_in('client_name', :with => 'Frodo')
    fill_in('client_stylist', :with => 'Samwise')
    click_button('Add Client')
    expect(page).to have_content('Frodo')
  end
end
