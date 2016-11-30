require('rspec')
require('cd')

describe(CD) do
  describe('#initialize') do
    it('creates a CD and gives it artist attribute') do
      new_cd = CD.new('Snoop Dogg','Doggystyle')
      expect(new_cd.artist).to(eq('Snoop Dogg'))
    end
    it('creates a CD and gives it album attribute') do
      new_cd = CD.new('Snoop Dogg','Doggystyle')
      expect(new_cd.album).to(eq('Doggystyle'))
    end
  end
end
