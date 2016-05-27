# Get Out !
And do something fun.  Maybe this will help.

##What it is.
This app will let you keep track of things you like, and help you find events in your city.
Folks will be able to log in and search for concerts, sports events, festivals, or whatever other thing they are into.  The app will keep track of all the 'things' a user has said they like, and each time they log in they can choose to just use specific search words, or go buck wild and search everything.  

###Keep track of stuff.
Once a search has been performed, each element will show up with a checkbox that a user can click on.  This will save it to their potential calendar of funtimes.  It can be deleted off at any point, and will automatically self-destruct once the event has passed.  

### MVP
If this all takes way longer than I expect, I will hope to at least create an app where a user can log in and perform a search to find local events and then keep track of the events they are interested in.  Loftier goals would include being able to notify others about cool events and email them links directly, connecting users to their friends so they can see what their friends have posted....

#### Target Audience
For now, me.  With all my free time that I have since I started Ada and had a child.  Actually since I have so free little time it would be nice to know what events are happening with as little effort possible.  And keep track of them.  Perhaps if this works well I can get some friends using it. We'll see how it goes.

#### Technology
I will setting up a basic rails app, using OAUTH to log in users (potentially with Spotify so that I can poke around and maybe do things like offer user concert suggestions based on their music preferences - that will take some poking around). I am going to try to scan a few event APIS like Eventful to run my searches, and then store the inforamtion in a postgres database.






