# Saan tayo kakaen? Kahit saan...

#### Background

I'm currently working remote, but I usually meetup with the team at a co-working space once a week... And during those meetups, we always have a dilemma of picking a place to eat within the vicinity of the co-working space. In tagalog, the convo usually goes as the title of this readme...

```
Colleague: Gutom na ako, saan tayo kakaen? (I'm hungry, where should we eat?)
Me: Kahit saan (Anywhere)
Colleague: Pambihira, walang resto na Kahit Saan ang pangalan dito (OMGWTH, there's no resto named "Anywhere" around here)
Me: Ikaw gutom, ikaw magisip (You're the one that is hungry, so you should pick where to eat)
Colleague: Wag nalang tayo kumaen (Let's diet :P)
```

#### Solution

Create a tool that would retrieve a list of Restaurants around the vicinity, and pick one at random. I was thinking of creating a web app for this, but I decided to take advantage of this to play around [Crystal](https://crystal-lang.org).

Oh, and use an existing platform's API rather than creating a new one that would then turn into a startup that would compete with other well established platforms... In other words: Use Zomato's API.

P.S. I'm not a Ruby developer, but I'm pretty attracted with how easy it is to dive into Crystal language compared to the other compiled language that I'm also self-studying ([Nim](https://nim-lang.org))... So my code might not be idiomatic "Ruby"/Crystal since I only learned how to write Crystal through the official docs. But I'd love to learn, please send me feedback and/or links to good books.

## Installation

- install libssl (dev version)
- install libcrypto (dev version)
- install Crystal duh
- execute `shards install`
- execute `crystal build src/kahitsaan.cr --release`
- add `ZOMATO_API_KEY` to your global env (Generate the API Key at [Zomato's site](https://developers.zomato.com/api))
- place binary to a folder that is included in your `PATH`. (I placed mine to `~/.local/bin`)

#### OR

- download the binary at the [releases page](https://github.com/dcefram/kahitsaan/releases) (only for Linux based OS)
- install libssl and libcrypto
- add `ZOMATO_API_KEY` to your global env (Generate the API Key at [Zomato's site](https://developers.zomato.com/api))
- place binary to a folder that is included in your `PATH`. (I placed mine to `~/.local/bin`)

## Usage

`kahitsaan --sa=greenbelt`

execute `kahitsaan --help` to view additional options.

## Contributing

1. Fork it (<https://github.com/dcefram/kahitsaan/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Daniel Cefram Ramirez](https://github.com/dcefram) - creator and maintainer

## Credits

- [Zomato API](https://developers.zomato.com/api) - Without Zomato, I wouldn't have wasted a couple of hours of my life creating this.
- [Crystal](https://crystal-lang.org)
- [Crest](https://github.com/mamantoha/crest)
