class AnticipationsController < ApplicationController
  def index
    @anticipations = Anticipation.all
  end

  def show
    @anticipation = Anticipation.find(params[:id])
  end

  def new
    @anticipation = Anticipation.new
  end

  def create
    @anticipation = Anticipation.new
    @anticipation.advance = params[:advance]
    @anticipation.description = params[:description]

    if @anticipation.save
      redirect_to "/anticipations", :notice => "Anticipation created successfully."
    else
      render 'new'
    end
  end

  def edit
    @anticipation = Anticipation.find(params[:id])
  end

  def update
    @anticipation = Anticipation.find(params[:id])

    @anticipation.advance = params[:advance]
    @anticipation.description = params[:description]

    if @anticipation.save
      redirect_to "/anticipations", :notice => "Anticipation updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @anticipation = Anticipation.find(params[:id])

    @anticipation.destroy

    redirect_to "/anticipations", :notice => "Anticipation deleted."
  end
end
