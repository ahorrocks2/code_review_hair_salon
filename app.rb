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

get('/stylist/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist)
end

patch('/stylist/:id') do
  name = params.fetch('new_name')
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.update({:name => name, :id => nil})

  redirect('/stylists')
end

delete('/stylist/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.delete()

  redirect('/stylists')
end

get('/clients') do
  @clients = Client.all()
  erb(:clients)
end

post('/clients/add') do
  name = params.fetch('client_name')
  client_stylist = params.fetch('client_stylist')
  result = DB.exec("SELECT * FROM stylists WHERE name = '#{client_stylist}';")
  stylist_id = result.first().fetch('id').to_i()
  new_client = Client.new({:name => name, :id => nil, :stylist_id => stylist_id })
  new_client.save()

  redirect('/clients')
end

get('/client/:id') do
  @client = Client.find(params.fetch('id').to_i())
  erb(:client)
end

patch('/client/:id') do
  name = params.fetch('new_name')
  stylist = params.fetch('new_stylist')
  result = DB.exec("SELECT * FROM stylists WHERE name = '#{stylist}';")
  stylist_id = result.first().fetch('id').to_i()
  @client = Client.find(params.fetch('id').to_i())
  @client.update({:name => name, :id => nil, :stylist_id => stylist_id})

  redirect('/clients')
end

delete('/client/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @client.delete()

  redirect('/client')
end
