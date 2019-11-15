class ColorsController < ApplicationController
  before_action :set_color, only: [:destroy]

  def create
    @color = Color.new(color_params)
    @index = Color.all.count;
    respond_to do |f|
      if @color.save
        f.html {
          redirect_to request.referrer
        }
        f.js {}
      else
        f.html { render request.referrer}
      end
    end
    
  end

  def destroy
    begin
       @color.destroy
      flash[:success] = "Deleted success"
      redirect_to request.referrer || root_url
    rescue 
      flash[:error] = "There are products of this color"
      redirect_to request.referrer || root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color
      @color = Color.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def color_params
      params.require(:color).permit(:color)
    end
end
