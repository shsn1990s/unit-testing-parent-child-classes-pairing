require 'music_library'
require 'track'

RSpec.describe "Integration Tests" do
  it "add multiple track objects and return as list" do
    musiclibrary = MusicLibrary.new
    musiclibrary.add(:faketrack1)
    musiclibrary.add(:faketrack2)
    expect(musiclibrary.all).to eq ([:faketrack1, :faketrack2])
  end
  it "search keywords in music library, returns second entry" do
    musiclibrary = MusicLibrary.new
    faketrack1 = double :faketrack1, matches?: true
    faketrack2 = double :faketrack2, matches?: false
    musiclibrary.add(faketrack1)
    musiclibrary.add(faketrack2)
    expect(musiclibrary.search("title 1")).to eq faketrack1
  end
  it "search keywords in music library, returns 'no match found' if no match is found" do
    musiclibrary = MusicLibrary.new
    faketrack1 = double :faketrack1, matches?: false
    faketrack2 = double :faketrack2, matches?: false
    musiclibrary.add(faketrack1)
    musiclibrary.add(faketrack2)
    expect(musiclibrary.search("title 3")).to eq "no match found"
  end

end