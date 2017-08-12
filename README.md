# `genderidentity.io`

##### *The best transgender support site ever.*

## Mission Statement

### What

`genderidentity.io` is a one-stop shop information and support website for transgender people.

Information means guides, news, advice navigating legal and medical hurdles, etc. Support means chat rooms, a forum, and ways to get in touch with IRL support organizations.

### Why

Current solutions are not satisfactory to us in terms of looks, curation, usability, and feel.

We want to be accessible as a priority. The most vulnerable user is the one who has just heard the word “trans” for the first time and is unsure as to whether that applies to them. To this user we must provide a clean, informative, level-headed environment and avoid scaring them away with fluff, confusion, and unnecessary attitude. The key concepts here being: trans people are normal people; it’s a medical issue, nothing more; the solution doesn't require conforming to stereotypes or acting a certain way.

Next in our order of priorities are partners, parents, and family of transgender individuals. These people are also vulnerable, though less prone to tragic outcomes, and the environment they need to see is the same as above, with the key message being: the person you love is still the person you love; this is how you help them through, this is how you help yourself; there are some things to be concerned about but there’s no reason to despair. E.g. https://www.reddit.com/r/mypartneristrans/

Lastly, we have outsiders. Curious people, journalists, and so on. All these need is well-presented, accurate information.

### How

It’s a website. We may provide:

- A live chat section.
- A forum section.
- Relevant news.
- Articles/guides.
- A wiki.
- Tech education & mentoring for trans individuals.

##### Read more [here](docs/about.md)

## Run the site locally (FIXME(justbaileym))

 1. Ensure you have [docker](https://www.docker.com/community-edition) installed.

 2. Run `make` to build the whole thing and launch the server

 3. Open up the following URL in a browser

        http://localhost:80

 4. To exit go `docker ps` to find the docker id and then `docker stop [id]`

## Database Setup (FIXME(justbaileym))

It looks like you chose to set up your application using a postgres database! Fantastic!

The first thing you need to do is open up the "database.yml" file and edit it to use the correct usernames, passwords, hosts, etc... that are appropriate for your environment.

You will also need to make sure that **you** start/install the database of your choice. Buffalo **won't** install and start postgres for you.

### Create Your Databases

Ok, so you've edited the "database.yml" file and started postgres, now Buffalo can create the databases in that file for you:

	$ buffalo db create -a


## Starting the Application

Buffalo ships with a command that will watch your application and automatically rebuild the Go binary and any assets for you. To do that run the "buffalo dev" command:

	$ buffalo dev

We've also set this up to run hugo as well. We've still gotta make it
serve all hugo stuff directly from disk, because at the moment Hugo
renders HTML files with the wrong base URL.

If you point your browser to [http://127.0.0.1:3000](http://127.0.0.1:3000) you should see our site homepage.

**Congratulations!** You now have your Buffalo application up and running.

## What Next?

We recommend you heading over to [http://gobuffalo.io](http://gobuffalo.io) and reviewing all of the great documentation there.

Good luck!

[Powered by Buffalo](http://gobuffalo.io)

