class Artist
  @@all_artists = []
  define_method(:initialize) do |name|
    @name = name
  end
  define_method(:name) do
    @name
  end
  define_method(:save) do
    @@all_artists.push(self)
  end
  define_singleton_method(:clear) do
    @@all_artists = []
  end
  define_singleton_method(:all) do
    @@all_artists
  end
end
