require('stylist')
require('client')
require('rspec')
require('pg')


DB = PGconn.new("ubuntu", 5432, nil, nil, "hair_salon_test", "ahorrocks", "alyssa")

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM stylists *;')
    DB.exec('DELETE FROM clients *;')
  end
end
