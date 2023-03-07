# Lunch and Learn

## Description
  - This application aggregates data and exposes RESTful API endpoints for a future front-end application to use to help users discover recipes from around the world. It follows requirements laid out in accordance with the Turing School of Software and Design requirements for the final project in module 3 of the backend engineering program. Further details can be found at https://backend.turing.edu/module3/projects/lunch_and_learn/

## Technologies Used
  - This app was developed using Rails 5.2.8 and Ruby 2.7.4.
  - Gems used can be found in the Gemfile.
  - This app requires API keys for external endpoints, and is currently set up to store them in a .env file at the top level of the program directory. API keys can be requested and must be named as follows:
    1. EDAMAM_APP_ID - https://developer.edamam.com/edamam-recipe-api
    2. EDAMAM_API_KEY - https://developer.edamam.com/edamam-recipe-api
    3. YOUTUBE_API_KEY - https://developers.google.com/youtube/registering_an_application
    4. UNSPLASH_API_KEY - https://unsplash.com/documentation
    5. PLACES_API_KEY - https://apidocs.geoapify.com/docs/places/#about

## Set-up
  - After creating your .env file and inputting the API keys as listed above, run `bundle` in the terminal to get all necessary gems installed.
  - In terminal, run `rails db:create` to create your database.
  - In terminal, run `rails s` to start the app on localhost:3000
  - Utilize postman or another API endpoint tool to query the server as listed below.

## Endpoints

  1. `GET /api/v1/recipes?country=<COUNTRY>`
    - This endpoint accepts a country name as a query parameter and will return a JSON list of recipes for that country in the following response format:
     
      {
        "data": [
            {
                "id": "null",
                "type": "recipe",
                "attributes": {
                    "title": "Recipe name",
                    "url": "www.recipe_url.com",
                    "country": "<COUNTRY>",
                    "image": "www.image_url.com"
                }
            },
            { recipe2...},
        ]
      }
    - If no country parameter is input, the endpoint will choose a random country and return recipes for that country.
    - If an invalid query parameter is input, this endpoint will return an empty data array as follows: 
      {
        "data": []
      }

  2. `GET /api/v1/learning_resources?country=<COUNTRY>`
    - This endpoint accepts a country name as a query parameter and will return a JSON list of 10 photos and 1 video about that country in the following response format:

    {
    "data": {
        "id": "null",
        "type": "learning_resource",
        "attributes": {
            "country": "<COUNTRY>",
            "video": {
                "title": "country history video title",
                "youtube_video_id": "J4Ej1TMU5H0"
            },
            "images": [
                {
                    "url": "www.photo_url.com",
                    "alt_tag": "photo description"
                },
                { photo2...},
              ]
          }
        }
      }
    - If an invalid country parameter is passed, this endpoint will return empty photo and video attributes in its JSON response as follows:
      {
        "data": {
            "id": "null",
            "type": "learning_resource",
            "attributes": {
                "country": "<invalid_country_name>",
                "video": {},
                "images": []
            }
        }
      }
  
  3. `POST api/v1/users`
    - This endpoint allows creation of a new user for the application and saves them to the database while returning their unique API key so that they can access their data upon future requests. It accepts the following data in the JSON BODY of the request:

      {
          "name": "<user_name>",
          "email": "<user_email>"
      }

    - The response for a valid request will return as follows: 

      {
        "data": {
          "id": "<user_id>",
          "type": "user",
          "attributes": {
            "name": "<user_name>",
            "email": "<user_email>",
            "api_key": "<user_api_key>"
            }
        }
      }

    - If the user's email is already in use in the database, the JSON response will appear as follows:

      {
        "message": "There was an error processing your request",
        "errors": [
          "Email has already been taken"
          ],
        "status": ""
      }

  4. `POST /api/v1/favorites`
    - This endpoint allows users to favorite recipes by passing their unique API key and the recipe info, the database will then store these favorites for recover later.
    - This endpoint requires a properly formatted JSON request body as follows:

      {
        "api_key": "<user_api_key",
        "country": "<country>",
        "recipe_link": "<recipe_url>",
        "recipe_title": "<recipe_title>"
      }

    - A successful request will receive the following JSON response:

      {
        "success": "Favorite added successfully"
      }

    - If a user attempts to create a favorite while passing an invalid API key, the following 403 response will be returned:

      {
        "errors": "Invalid API key"
      }

  5. `GET /api/v1/favorites?api_key=<user_api_key>`
    - This endpoint accepts the user's API key as a query parameter, and returns all the recipes they have favorited previously with a JSON response format as follows:

      {
        "data": [
            {
                "id": "<favorite_id>",
                "type": "favorite",
                "attributes": {
                    "recipe_title": "<recipe_title>",
                    "recipe_link": "<recipe_url>",
                    "country": "<recipe_country>",
                    "created_at": "<date_time_favorite_created>"
                }
            },
            {favorite2...}
        ]
      }

    - If a user attempts to access favorites while passing an invalid API key, the following 403 response will be returned:

      {
        "errors": "Invalid API key"
      }

  6. `GET /api/v1/tourist_sights?country=<country>`

    - This endpoint accepts a country name as a query parameter and will return a list of Tourist Sights within 5km of that country's capital in the following JSON response format:

      {
        "data": [
            {
                "id": "null",
                "type": "tourist_sight",
                "attributes": {
                    "name": "<tourist_sight_name>",
                    "address": "<tourist_sight_address>",
                    "place_id": "<tourist_sight_place_id>"
                }
            },
            { tourist_sight2...}
        ]
      }

    - NOTE: This endpoint is still in progress, and strange results or errors may occur if an incorrect country name is passed as a query parameter. Be sure to spell the country's name correctly in order to receive an appropriate response.
        
