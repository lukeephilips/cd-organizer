  class CD
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
  end
