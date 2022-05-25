# {{PROBLEM}} Multi-Class Design Recipe
## 1. Describe the Problem
> As a user
> So that I can add, view and search tracks
> I want to see a list of all track objects and filter by any given keyword


## 2. Design the Class system
   ┌────────────────────┐
   │ Music Library      │
   │                    │
   │ - add              │
   │                    │
   │ - all              │
   │                    │
   │ - search(keyword)  │
   └─────────▲──────────┘
             │
             │
             │
             │
   ┌─────────┴──────────┐
   │ Track              │
   │                    │
   │ - initialize       │
   │                    │
   │ - matches          │
   │                    │
   └────────────────────┘

Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important,
not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

Also design the interface of each class in more detail.

```ruby
class MusicLibrary
  def initialize
    # ...
  end

  def add(track) # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
  end

  def all
    # Returns a list of track objects
  end
  
  def search(keyword) # keyword is a string
    # Returns a list of tracks that match the keyword
  end
end

class Track
  def initialize(title, artist) # title and artist are both strings
  end

  def matches?(keyword) # keyword is a string
    # Returns true if the keyword matches either the title or artist
  end
end

```

## 3. Create Examples as intergration Tests

ADVICE: Start with 1st intigration test and when you cant progress move to unit test. Repeat this process

Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

```ruby
# 1 add multiple track objects and return as list
musiclibrary = MusicLibrary.new
musiclibrary.add(double(:faketrack1))
musiclibrary.add(double(:faketrack2))
expect(musiclibrary.all).to eq.([faketrack1, faketrack2])

# 2 search keywords in music library, returns second entry
musiclibrary = MusicLibrary.new
musiclibrary.add(double(:faketrack1("title1", "artist 1")))
musiclibrary.add(double(:faketrack2("title2", "artist 2")))
expect(musiclibrary.search("title 1")).to eq [faketrack1]

# 3 search keywords in music library, returns "no match found if no match is found"
musiclibrary = MusicLibrary.new
musiclibrary.add(double(:faketrack1("title1", "artist 1")))
musiclibrary.add(double(:faketrack2("title2", "artist 2")))
expect(musiclibrary.search("title 3")).to eq "no match found"


```
## 4. Create Examples as unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

```ruby
Track class

# 1 Searches for keyword and returns true if keyword matches title or artist
track = Track.new("title 1", "artist 1")
expect(track.matches?("artist 1")).to eq true

# 2 Searches for keyword and returns false if keyword matches no title or artist
track = Track.new("title 1", "artist 1")
expect(track.matches?("artist 12")).to eq false

```
_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.