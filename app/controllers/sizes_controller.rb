class SizesController < ApplicationController
  before_action :set_size, only: [:destroy]

  def create
    @size = Size.new(size_params)
    @index = Size.all.count;
    respond_to do |f|
      if @size.save
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
       @size.destroy
      flash[:success] = "Deleted success"
      redirect_to request.referrer || root_url
    rescue 
      flash[:error] = "There are products of this size"
      redirect_to request.referrer || root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_size
      @size = Size.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def size_params
      params.require(:size).permit(:size)
    end
end
