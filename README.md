Upload photo albums, crop your photos, & see analytics for who has viewed your albums.

Try it out at http://photozz.herokuapp.com

For the most up to date version of Photozz, you can also clone the repo down and try it out on your own machine:

```
git clone https://github.com/csnedecor/photoz.git
bundle install
rake db:create
rake db:migrate
```

This application uses the Paperclip gem for photo attachments. If your computer doesn't already have it, you will need to install ImageMagick to run the application locally.  More information here: https://github.com/thoughtbot/paperclip



I used Test Driven Development to build the application on Ruby on Rails with a Postgres database. Analytics are custom built with visualizations using C3js, D3js and HighCharts. The app is styled using Foundation and custom CSS. Uses TDD with Capybara & RSpec.
