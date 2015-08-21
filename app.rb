require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PGconn.new("ubuntu", 5432, nil, nil, "hair_salon_test", "ahorrocks", "alyssa")

get('/') do
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

post('/stylists/add') do
  name = params.fetch('stylist_name')
  new_stylist = Stylist.new({:name => name, :id => nil})
  new_stylist.save()

  redirect('/stylists')
end

get('/clients') do
  @clients = Client.all()
  erb(:clients)
end
