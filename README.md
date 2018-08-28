# 🎶 WhatsPlaying 🎶

This is an application that uses the [Twilio API for WhatsApp](https://www.twilio.com/whatsapp) and the [Spotify API](https://developer.spotify.com/documentation/web-api/) to build a collaborative playlist.

Read how to [build a collaborative playlist over WhatsApp with Rails, Twilio and Spotify](https://www.twilio.com/blog/collaborative-playlist-whatsapp-rails-twilio-spotify) on the Twilio blog.

## To run the application

You will need a few things to run this application.

* [Ruby](https://www.ruby-lang.org/en/downloads/) installed, I'm using the latest, 2.5.1
* Rails and bundler, which you can install with `gem install rails bundler`
* A Twilio account ([sign up for a free Twilio account here](http://twilio.com/try-twilio))
* Your [WhatsApp sandbox](https://www.twilio.com/console/sms/whatsapp/sandbox) set up in your Twilio account
* [A Spotify developer account](https://developer.spotify.com/)
* [ngrok](https://ngrok.com), so we can [tunnel through to our locally developed application to use webhooks](https://www.twilio.com/blog/2015/09/6-awesome-reasons-to-use-ngrok-when-testing-webhooks.html)

### Spotify API credentials

To work with the Spotify API we will need to generate some API credentials. From the [Spotify developer dashboard](https://developer.spotify.com/dashboard/applications) create a new application and follow the 3 step process.

1. First, some details about your app. Name it, I called mine WhatsPlaying, provide a short description and check what app type it is, I chose "website"
2. Next you're asked if this is a commercial integration, choose "no"
3. Finally, check the agreements

Once you've completed these steps you will see the application dashboard. You will need the Client ID and Client Secret from this page.

There's one more thing we need to do here. Click on "edit settings", enter the redirect URL `http://localhost:3000/auth/spotify/callback` and click "add".

### Prepare this application

Clone the application, change into the directory and install the dependencies with bundler.

```bash
git clone https://github.com/philnash/whats_playing.git
cd whats_playing
bundle install
```

Copy `config/env.yml.example` to `config/env.yml` and fill in the Spotify Client ID and Secret. Then, start the application:

```bash
bundle exec rails server
```

Open [localhost:3000](http://localhost:3000/) and sign in with Spotify. When you complete the OAuth flow you will be presented with the remaining Spotify credentials that you need. Copy these and enter them into `config/env.yml`.

Restart the application and load the home page again. You will see an empty embedded playlist (which you will also find in your Spotify account now).

You're now ready to build the rest of the application. Read the blog post on how to [build a collaborative playlist over WhatsApp with Rails, Twilio and Spotify](https://www.twilio.com/blog/collaborative-playlist-whatsapp-rails-twilio-spotify).