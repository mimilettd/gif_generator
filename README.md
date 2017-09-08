# Project Option 2: GifGenerator

Create an app where users can “favorite” gifs.

## Gifs

  * Admins can generate gifs by entering a one-word search term in field and then clicking “generate gif”. This should create a new gif in the database. This feature is not available to regular users.
  * Gifs should have an image_path. See above “Images” in project #1 for more info on implementing images.
  * Use the GiphyApi to generate gifs.

## Favoriting

  * Regular users can mark a gif as “favorite”.
  * Regular users can see a list of all of the gifs they’ve marked as favorites.
  * Regular users cannot delete a gif; they can only “unfavorite” it for themselves.
  * Regular users should be able to see all gifs sorted by category.
  * Regular users should be able to see favorited gifs sorted by category.

## Categories

  * Gifs belong to a category (category is the original word that was searched for by the admin).
  * categories can be created and destroyed by a logged-in admin user (regular logged in users cannot create or destroy categories)

## Authentication and Authorization

  * users need to log in to see their favorited gifs
  * users can only see their own favorited gifs – they should not be able to visit another user’s page
  * users cannot create favorites for other users
  * users cannot create new categories – only the admin can do that
  * users cannot create gifs – only the admin can do that
  * visitors (non-registered users) can create user accounts

## Optional Extensions

  * Implement Twitter, Github, or Facebook OAuth login
  * Use HAML for your views
  * TDD using RSpec instead of Test::Unit
