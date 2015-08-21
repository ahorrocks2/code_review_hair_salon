require('spec_helper')

describe(Client) do
  describe('#name') do
    it('return the name of the client') do
      test_client = Client.new({:name => 'Gandalf', :id => nil, :stylist_id => 1})
      expect(test_client.name()).to(eq('Gandalf'))
    end
  end

  describe('.all') do
    it('return an empty list at first, all clients once clients saved') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('save a client to the list of clients') do
      test_client1 = Client.new({:name => 'Aragorn', :id => nil, :stylist_id => 1})
      test_client1.save()
      expect(Client.all()).to(eq([test_client1]))
    end
  end

  describe('#==') do
    it('overwrite the equal operator') do
      test_client1 = Client.new({:name => 'Aragorn', :id => nil, :stylist_id => 1})
      test_client2 = Client.new({:name => 'Aragorn', :id => nil, :stylist_id => 1})
      expect(test_client1).to(eq(test_client2))
    end
  end

  describe('#update') do
    it('allow owner to update clients') do
      test_client = Client.new({:name => 'Legolas', :id => nil, :stylist_id => 1})
      test_client.save()
      test_client.update({:name => 'Sauron', :id => nil, :stylist_id => 1})
      expect(test_client.name()).to(eq('Sauron'))
    end
  end

  describe('#delete') do
    it('allow the owner to delete a client') do
      test_client1 = Client.new({:name => 'Legolas', :id => nil, :stylist_id => 1})
      test_client1.save()
      test_client2 = Client.new({:name => 'Sauron', :id => nil, :stylist_id => 1})
      test_client2.save()
      test_client2.delete()
      expect(Client.all()).to(eq([test_client1]))
    end
  end

end
