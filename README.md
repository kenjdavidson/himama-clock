# Punch Clock

Provides a punch clock implementation - related to the Himama Coding Challenge.

> Full transparency - I was Googling around in my spare time and came across an older version of this.  Since the worse case scenario was that this version was completely different and I might still get some practice, I spent some time over the last few days working on it.  Now that I've received your official request, I've spent the remainder of the time finalizing it with regards to the specific requests.

## Implementation

The solution was implemented in Ruby/Rails.  Although my experience would have dictated using Java I felt that as the role in question was for Ruby/Rails it was important to give an idea of not only my design processes, but my learning processes as well.  The project includes:

- [Ruby 3.0](https://www.ruby-lang.org/)
- [Rails 7](https://guides.rubyonrails.org/)
- [Bootstrap](https://getbootstrap.com/)
- [Stimulus](https://stimulus.hotwired.dev/)

### Hiccups

There were some issues/growing pains while completing the project:

- Getting Bootstrap working out of the box with Rails 7 didn't work off the bat.  The bootstrap `data-api` doesn't seem to work, which means each component needed to have it's javascript added manually - [https://www.bootrails.com/blog/rails-7-bootstrap-5-tutorial/](https://www.bootrails.com/blog/rails-7-bootstrap-5-tutorial/)
- Researching the classes/functionality that I needed to match what I'd have done in Java was a little more time consuming that I anticipated.  The project took a little over the 6 hour expectation (well over the 4 hour expectation in the current document, although trying to decide on must haves vs nice to haves it could have been much longer)
- Need substantially more work on Ruby/RSpec testing

### Punch Clock

The initial implementation of the punch clock is a standard/basic page containing a simple form allowing for as quick as entry as possible.   The current functionality includes (what I believe to be standard):

- [x] Clock In and Clock Out buttons
- [x] Quick and easy entry (no required login)
- [x] Confirmation/Error display

#### Extra Day

With an extra day I'd spend time cleaning up the look and feel of the form:

- [ ] Cleanup look and feel
- [ ] Clean up error handling

#### Extra Month

With an extra month, I'd work on making the punch clock more robust and available on different platforms:

- [ ] Clean up the look and feel (although this is dependent on selected hardware)
- [ ] Provide hardware specific implementations based on requirements
- [ ] Provide scanning of ID cards (hardware dependant)
- [ ] Provide different types of biometric login (hardware dependant)

### Administration

With regards to administration, I would have preferred to keep the pages completely separate.  As mentioned above, I don't even think the punch clock should have the admin panel available.  There should be a portal for user management and administration to be done.

> With that said, there is an `/admin` link on the bottom of the punch clock, or users can go to the `/admin` url manually

- [x] Users can login at `/admin`

#### Extra Day

The administration panel is lacking, due to the time constraint in the document, I didn't want to go (much more over this than I had already).  

- [ ] Get the editing of Time Events working
- [ ] Get the authorization working so that TEACHERS can only access their own profiles while ADMINS can access the full functionality

#### Extra Month

- [ ] Extend login functionality from basic password to OAuth to allow for different clients
- [ ] Provide extended administrator features (TBD)
- [ ] Provide reporting

### Additional Features

- [ ] Punch clock should provide multiple implementations.  A punch clock should be it's own implementation separated and available on different hardware: Android/IOS device, Hardware scanner (bar/QR), etc.

## Contribution

Development environment:

- Visual Studio Code (although any would do)
- Devcontainers (Ruby/Rails & Posgres images)

## License

TBD