class RoutesController < ApplicationController
  def index
    @routes = current_user.routes
  end

  def show
    @route = Route.find(params[:id])
  end

  def compare
    @route = Route.find(params[:id])
    require 'open-uri'
    require 'json'
    require 'curl'
    require 'curb'
    #Source Data
    @source_address = @route.source
    @safe_source_address = URI.encode(@source_address)

    parsed_data = JSON.parse(open("https://maps.googleapis.com/maps/api/geocode/json?address="+@safe_source_address+"&key=AIzaSyCRr5G5OPo7bo70QcQ--JntgZLJRhbVtVw").read)

    @slat = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @slng = parsed_data["results"][0]["geometry"]["location"]["lng"]

    #Destination Data
    @destination_address = @route.destination
    @safe_destination_address = URI.encode(@destination_address)
    parsed_data = JSON.parse(open("https://maps.googleapis.com/maps/api/geocode/json?address="+@safe_destination_address+"&key=AIzaSyCRr5G5OPo7bo70QcQ--JntgZLJRhbVtVw").read)

    @dlat = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @dlng = parsed_data["results"][0]["geometry"]["location"]["lng"]
#Uber query
    if @route.passengers <=2
      parsed_data = JSON.parse(open("https://api.uber.com/v1/estimates/price?server_token=irnTl1k3n6Q2HQ5kSPFfRc3wWTZUZGqvFrqwszLl&start_latitude="+@slat.to_s+"&start_longitude="+@slng.to_s+"&end_latitude="+@dlat.to_s+"&end_longitude="+@dlng.to_s+"&seat_count="+@route.passengers.to_s).read)
    elsif @route.passengers > 2
      parsed_data = JSON.parse(open("https://api.uber.com/v1/estimates/price?server_token=irnTl1k3n6Q2HQ5kSPFfRc3wWTZUZGqvFrqwszLl&start_latitude="+@slat.to_s+"&start_longitude="+@slng.to_s+"&end_latitude="+@dlat.to_s+"&end_longitude="+@dlng.to_s).read)
    end

#Uber pricing
    @uberp1 = parsed_data["prices"][0]["estimate"]
    @uberd1 = parsed_data["prices"][0]["localized_display_name"]
    @uberp2 = parsed_data["prices"][1]["estimate"]
    @uberd2 = parsed_data["prices"][1]["localized_display_name"]
    @uberp3 = parsed_data["prices"][2]["estimate"]
    @uberd3 = parsed_data["prices"][2]["localized_display_name"]
    @uberp4 = parsed_data["prices"][5]["estimate"]
    @uberd4 = parsed_data["prices"][5]["localized_display_name"]
    @uberp5 = parsed_data["prices"][6]["estimate"]
    @uberd5 = parsed_data["prices"][6]["localized_display_name"]
    @uberp6 = parsed_data["prices"][7]["estimate"]
    @uberd6 = parsed_data["prices"][7]["localized_display_name"]

    #Lyft Query
# c = Curl::Easy.perform('https://www.google.com') do |curl|
#
# end

  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new
    @route.user_id = params[:user_id]
    @route.passengers = params[:passengers]
    @route.frecuency = params[:frecuency]
    @route.departure = params[:departure]
    @route.destination = params[:destination]
    @route.source = params[:source]
    @route.anticipation_id = params[:anticipation_id]
    @route.name = params[:name]

    if @route.save
      redirect_to "/routes", :notice => "Route created successfully."
    else
      render 'new'
    end
  end

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])

    @route.user_id = params[:user_id]
    @route.passengers = params[:passengers]
    @route.frecuency = params[:frecuency]
    @route.departure = params[:departure]
    @route.destination = params[:destination]
    @route.source = params[:source]
    @route.anticipation_id = params[:anticipation_id]
    @route.name = params[:name]

    if @route.save
      redirect_to "/routes/"+@route.id.to_s, :notice => "Route updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @route = Route.find(params[:id])

    @route.destroy

    redirect_to "/routes", :notice => "Route deleted."
  end
end
