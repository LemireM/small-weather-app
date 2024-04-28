require 'net/http'
require 'json'
class WeatherController < ApplicationController
  def index
    if params[:city].present?
      coordinates = Geocoder.coordinates(params[:city])
      if coordinates.present?
        url = "https://api.openweathermap.org/data/3.0/onecall?lat=#{coordinates[0]}&lon=#{coordinates[1]}&exclude={part}&appid=c68ee2d7664c5a19c544c5a3c7aa9e16"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        @weather = JSON.parse(response)
      else
        @error = "It seems this city does not exist. Please try again."
      end
    end
  end
end
