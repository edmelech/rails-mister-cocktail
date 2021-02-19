class DosesController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    @cocktail = Restaurant.find(params[:restaurant_id])
    @dose = Doses.new
  end

  def create
      @dose = Dose.new(review_params)
      @cocktail = Cocktail.find(params[:cocktail_id])
      @dose.cocktail = @cocktail
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render(:new)
      end
    end

    def destroy
    end

    private

    def review_params
      params.require(:dose).permit(:content)
    end
end


