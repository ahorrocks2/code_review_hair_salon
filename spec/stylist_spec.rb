require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it('return the stylists name') do
      test_stylist = Stylist.new({:name => 'Frodo', :id => nil})
      expect(test_stylist.name()).to(eq('Frodo'))
    end
  end

  describe('.all') do
    it('return an empty array at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('add a stylist to the list of stylists') do
      test_stylist = Stylist.new({:name => 'Sam', :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('#==') do
    it('overwrite the equal comparison') do
      test_stylist1 = Stylist.new({:name => 'Pippin', :id => nil})
      test_stylist2 = Stylist.new({:name => 'Pippin', :id => nil})
      expect(test_stylist1).to(eq(test_stylist2))
    end
  end

end
