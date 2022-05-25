class MusicLibrary
  def initialize
    @musiclibrary = []
  end

  def add(track) 
    @musiclibrary << track
  end

  def all
    return @musiclibrary
  end
  
  def search(keyword) # keyword is a string
    # Returns a list of tracks that match the keyword
    @musiclibrary.each do |track|
      if track.matches?(keyword) == true
        return track
      else 
        return "no match found"
      end
    end
  end
end