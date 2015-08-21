require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it('return the stylists name') do
      test_stylist = Stylist.new({:name => 'Frodo', :id => nil})
      expect(test_stylist.name()).to(eq('Frodo'))
    end
  end


end
