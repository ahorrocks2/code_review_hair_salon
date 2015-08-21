require('spec_helper')
require('client')

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

  describe('#update') do
    it('allow owner to update stylists') do
      test_stylist = Stylist.new({:name => 'Arwen', :id => nil})
      test_stylist.save()
      test_stylist.update({:name => 'Galadriel', :id => nil})
      expect(test_stylist.name()).to(eq('Galadriel'))
    end
  end

  describe('#delete') do
    it('allow owner to delete a stylist from the list') do
      test_stylist1 = Stylist.new({:name => 'Boromir', :id => nil})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:name => 'Faramir', :id => nil})
      test_stylist2.save()
      test_stylist1.delete()
      expect(Stylist.all()).to(eq([test_stylist2]))
    end
  end

  describe('#clients') do
    it('returns the clients that belong to a given stylists id') do
      test_stylist1 = Stylist.new({:name => 'Gimli', :id => nil})
      test_stylist1.save()
      test_client1 = Client.new({:name => 'Treebeard', :id => nil, :stylist_id => test_stylist1.id().to_i()})
      test_client1.save()
      expect(test_stylist1.clients()).to(eq([test_client1]))
    end
  end

  describe('.find') do
    it('return a stylist that matches the id') do
      test_stylist1 = Stylist.new({:name => 'Boromir', :id => nil})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:name => 'Faramir', :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist1.id().to_i())).to(eq(test_stylist1))
    end
  end
end
