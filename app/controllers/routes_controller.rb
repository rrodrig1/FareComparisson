class RoutesController < ApplicationController
  def index
    @routes = Route.all
  end

  def show
    @route = Route.find(params[:id])
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
      redirect_to "/routes", :notice => "Route updated successfully."
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
