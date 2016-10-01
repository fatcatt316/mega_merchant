#MegaMerchant
In which Joe explores the wild world of Elixir n' Phoenix.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- END doctoc generated TOC please keep comment here to allow auto update -->
- [Purpose](#purpose)
  - [Learnin' Purpose](#learnin-purpose)
  - [App's Purpose](#apps-purpose)
- [Lessons Learnt](#lessons-learnt)
  - [Phoenix](#phoenix)
  - [Database](#database)
  - [Learn more](#learn-more)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

##Purpose  

### Learnin' Purpose
I'ma learn me some Elixir n' Phoenix. I'm gonna dedicate the month of October to getting better at Elixir, and to getting a working Elixir app deployed.

I plan on putting at least **2 hours a week** into this.

If you know any Elixir, feel free to leave comments about my rookie mistakes.

Thanks!

### App's Purpose
Have you ever wanted to sell/give something away online, but then you have go through the work of posting on Craigslist, Nextdoor, Kijiji, Freecycle, etc.?

Well **MegaMerchant©®™** will be a _one-stop shop_ to manage your ads! Post ads to multiple sites, edit them, and delete them once they're not needed! All in one simple place.

**MegaMerchant™®©** will make use of any available APIs for these sites, and if they don't have one... I guess it'll use some Elixir equivalent of Mechanize, Watir, or something else along those lines.

## Lessons Learnt
Install Node.js dependencies with `npm install`

### Phoenix
"IEX" = "Interactive Elixir"  

Start console with dependencies:  
`iex -S mix`

Start server with dependencies:  
`iex -S mix phoenix.server`

Install dependencies:  
`mix deps.get`

Start Phoenix endpoint:  
`mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### Database

Configuration:  
`config/dev.exs`  

Run migrations:  
`mix ecto.migrate`

### Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
