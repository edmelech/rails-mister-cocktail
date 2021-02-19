class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

      if @garden.save
        format.html { redirect_to @cocktail, notice: 'Cocktail was successfully created.' }
        format.json { render :show, status: :created, location: @cocktail }
      else
        format.html { render :new }
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredients)
  end
end
