class CD
  @@all_cds = []
  define_method(:initialize) do |artist, album|
    @artist = artist
    @album = album
    @id = @@all_cds.length + 1
  end
  define_method(:artist) do
    @artist
  end
  define_method(:album) do
    @album
  end
  define_method(:id) do
    @id
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
  define_singleton_method(:find) do |identification|
    found_cd = nil
    @@all_cds.each do |album|
      if album.id().eql?(identification.to_i)
        found_cd = album
      end
    end
    found_cd
  end
end
