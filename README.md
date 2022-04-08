# Punch Clock

Provides a punch clock implementation - related to the Himama Coding Challenge.

## Design Considerations

To get the application up and running the initial version is build around Rails.  

1. Users/Administers must be able to login and manage Employees (including time entries)
2. Employees must be able to clock in/out throught the day

## Implementation

Initially implemented as a simple Ruby/Rails application.

### Admin(s)

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