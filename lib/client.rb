class Client
  attr_reader(:name, :id, :stylist_id)
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch('name')
      id = client.fetch('id')
      stylist_id = client.fetch('stylist_id').to_i()
      clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_client|
    self.name() == another_client.name() && self.stylist_id() == another_client.stylist_id()
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    @stylist_id = attributes.fetch(:stylist_id, @stylist_id)
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end
end
