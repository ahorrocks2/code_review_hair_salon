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

end
