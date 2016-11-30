require('rspec')
require('artists')

describe(Artist) do
  before() do
    Artist.clear()
    @new_artist = Artist.new('Snoop Dogg')
    @new_artist.save()
    @new_artist2 = Artist.new('Bob Dylan')
    @new_artist2.save()
  end
  describe('#initialize') do
    it('creates an Artist and gives it artist attribute') do
      expect(@new_artist.name).to(eq('Snoop Dogg'))
    end
    it('creates an array featuring all artists') do
      expect(Artist.all).to(eq([@new_artist, @new_artist2]))
    end
  end
end
