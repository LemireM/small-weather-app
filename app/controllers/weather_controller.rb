require 'net/http'
class WeatherController < ApplicationController
  def index
    url = 'https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude={part}&appid=c68ee2d7664c5a19c544c5a3c7aa9e16'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @weather = JSON.parse(response)
  end
end
