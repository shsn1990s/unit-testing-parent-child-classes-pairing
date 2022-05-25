require 'track'

RSpec.describe Track do

  it "Searches for keyword and returns true if keyword matches title or artist" do
    track = Track.new("title 1", "artist 1")
    expect(track.matches?("artist 1")).to eq true
  end

  it "Searches for keyword and returns false if keyword matches no title or artist" do
    track = Track.new("title 1", "artist 1")
    expect(track.matches?("artist 12")).to eq false
  end

end