require('spec_helper')

describe(Client) do
  describe('#name') do
    it('return the name of the client') do
      test_client = Client.new({:name => 'Gandalf', :id => nil, :stylist_id => 1})
      expect(test_client.name()).to(eq('Gandalf'))
    end
  end

end
