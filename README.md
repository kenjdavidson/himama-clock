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

#### Future Enhancements

As mentioned above, a few enhancements that should be made 

- [ ] Clean up the look and feel (although this is dependent on selected hardware)
- [ ] Provide hardware specific implementations based on requirements
- [ ] Provide scanning of ID cards (hardware dependant)
- [ ] Provide different types of biometric login (hardware dependant)

> The admin panel can be accessed manually `/admin` or via the Admin link that was added to make life a little easier

### Administration



Adminsitrators have the ability to:

- Login
- View daily clock entries
- Add/Modify clock entries

#### Additional Features

- [ ] Extend login functionality from basic password to OAuth to allow for different clients
- [ ] Provide extended administrator features (TBD)
- [ ] Provide reporting

### User(s)

Employees (which may be users) are required to punch in/out through the day.  Basic functionality for punching would be to require:

- Enter their User Id
- Enter their Pin Code 
- Select In/Out 

> Punching in should be as quick and painless for employees as possible

#### Additional Features

- [ ] Punch clock should provide multiple implementations.  A punch clock should be it's own implementation separated and available on different hardware: Android/IOS device, Hardware scanner (bar/QR), etc.

### Event(s)

Punch clock events provide a history of when/where the employee punched in.

#### Additional Features

- [ ] Employees may be able to punch in/out at different locations.   Validation would be required (ie. should you stop an Employee from punching in or out across locations?)

## Contribution

Development environment:

- Visual Studio Code (although any would do)
- Devcontainers (Ruby/Rails & Posgres images)

## License

TBD