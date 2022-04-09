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
- For some reason my `link_to .... method: :delete` isn't working anywhere, looking into the issue it looks like options are `method: :delete`, `data: { method: :delete }` or `turbo_method: :delete`; none of which work at this point.

### Sample Data

Sample teacher data is populated with `rails users:test_users` where the following are available:

- `Admin`, `admin@teachers.com`
- `Teacher One`, `teacher1@teachers.com`
- `Teacher Two`, `teacher2@teachers.com`

All of which have the following:

- Password `p@assword`
- Pincode `1234`

## Punch Clock

The initial implementation of the punch clock is a standard/basic page containing a simple form allowing for as quick as entry as possible.   The current functionality includes (what I believe to be standard):

- [x] Clock In and Clock Out buttons
- [x] Quick and easy entry (no required login)
- [x] Confirmation/Error display

### Implementation Details

The initial decision was to use a single table to manage this:

`time_events` with:
- user_id
- event_time
- event_type of `enum [:clock_in :clock_out]`

This allows for simple logins, but if we needed to be able to modify this with additional types:

- `clock_in`, `clock_out`
- `break_in`, `break_out`
- `lunch_in`, `lunch_out`

it would need to be extended with the appropriate association.

### Extra Day

With an extra day I'd spend time cleaning up the look and feel of the form:

- [ ] Clean up the punch clock form to stop/disallow saving password info
- [ ] Fix the issue with `DELETE /path` not working
- [ ] Cleanup look and feel
- [ ] Clean up error handling
- [ ] Wrap info/error messages in a Stimulus controller for auto hiding notifications

### Extra Month

With an extra month, I'd work on making the punch clock more robust and available on different platforms:

- [ ] Clean up the look and feel (although this is dependent on selected hardware)
- [ ] Provide hardware specific implementations based on requirements
- [ ] Provide scanning of ID cards (hardware dependant)
- [ ] Provide different types of biometric login (hardware dependant)

## Administration

With regards to administration, I would have preferred to keep the pages completely separate.  As mentioned above, I don't even think the punch clock should have the admin panel available.  There should be a portal for user management and administration to be done.

> With that said, there is an `/admin` link on the bottom of the punch clock, or users can go to the `/admin` url manually

- [x] Users can login at `/admin`

### Implementation Details

At this point the users are pretty simple:

`users`
- personal info
- password
- pincode
- roles

`roles`
- name

Although some gotcha's while working with rails, for example keeping the password and pincode in the main `users` table causes some problems with validation and saving.  For example, just updating the users information requires the other items.  If I were doing this in Java I'd have probably split up the modeling into:

`users` table for high level information
- id
- email (primary)
- etc

`profiles` table for personal details
- name
- etc

`authentications`
- password
- pincode

although this doesn't seem to work with the `has_secure_password` functionality, so I'm probably missing something in my review of how Rails deals with this.

### Extra Day

The administration panel is lacking, due to the time constraint in the document, I didn't want to go (much more over this than I had already).  

- [ ] Get used to Ruby `DateTime` and ensure that the times are being formatted for the timezone of the user
- [ ] Implement the editing of time events by users and administrators
- [ ] Get the authorization working so that TEACHERS can only access their own profiles while ADMINS can access the full functionality
- [ ] Add date filters to the Profile event display

> With regards to editing, I would implement this by allowing users to **request** time event changes, which would then notify the administrators so that they may follow up on the request.  Being able to directly modify your own clock ins/outs would go against the point of clocking in and out.

### Extra Month

- [ ] Clean up the Profile and Admin screens, provide a better layout allowing for more options
- [ ] Extend login functionality from basic password to OAuth to allow for different clients
- [ ] Provide extended administrator features (TBD)
- [ ] Provide reporting

## Additional Features

On top of the features listed above, the following would be included in next steps

- [ ] Figuring out how to work with Ruby resource bundles and internationaliazation (including time zones mentioned above)

## Contribution

Development environment:

- Visual Studio Code (although any would do)
- Devcontainers (Ruby/Rails & Posgres images)

