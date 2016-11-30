class CD
  @@all_cds = []
  define_method(:initialize) do |artist, album|
    @artist = artist
    @album = album
  end
  define_method(:artist) do
    @artist
  end
  define_method(:album) do
    @album
  end
  define_method(:save) do
    @@all_cds.push(self)
  end
  define_singleton_method(:clear) do
    @@all_cds = []
  end
  define_singleton_method(:all) do
    @@all_cds
  end
end
