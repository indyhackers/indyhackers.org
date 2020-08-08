# IndyHackers.org

![TravisCI](https://travis-ci.org/mileszs/indyhackers.org.svg?branch=master)
[![Code Climate](https://codeclimate.com/github/mileszs/indyhackers.org/badges/gpa.svg)](https://codeclimate.com/github/mileszs/indyhackers.org)

## Contributing

```
git clone [your fork]
cd indyhackers.org
bin/setup
bundle exec rails s
```

And, if you're on macOS or another OS with this command available to you, you can stay in the terminal but open your browser using `open http://localhost:3000`.

To access the admin pages, visit `http://localhost:3000/admins/sign_in` and use the seeded admin `admin@example.com` with password `indyhacker`

## To Do

These are ideas, anyway.

### General
- Use Google calendar API instead of widgets for calendar on the front page?
- Is it time for a new design?
- Should the main, content-y stuff be static leaving the job board as the only thing requiring "a backend" (which we could locate at jobs.indyhackers.org)?
- Offer meeting organizers a list of open weekday evenings, pulled dynamically from current calendar data.

### Job Board
- Read-only API
- Allow hackers to apply on the site, rather than finding info in the post
  - GitHub link
  - LinkedIn link
  - Upload resume
- Make it work well on mobile devices
- Consider using a completely different design from the main site for the job board
