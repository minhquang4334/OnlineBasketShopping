class DetailModelsController < ApplicationController
  before_action :set_detail_model, only: [:show, :edit, :update, :destroy]

  def index
    @detail_models = DetailModel.all
  end

  def show
  end

  def new
    @detail_model = DetailModel.new()
    @size = Size.new()
    @color = Color.new()
  end

  def edit
    @size = Size.new()
    @color = Color.new()
  end

  def create
    @detail_model = DetailModel.new(detail_model_params)
    if @detail_model.save
      flash[:success] = "Created success"
      redirect_to detail_models_path
    else
      render :new
    end
  end

  def update
    if @detail_model.update_attributes detail_model_params
      flash[:success] = "Updated success"
      redirect_to @detail_model
    else
      render :edit
    end
  end

  def destroy
    @detail_model.destroy
    flash[:success] = "Deleted success"
    redirect_to request.referrer || root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail_model
      @detail_model = DetailModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_model_params
      params.require(:detail_model).permit(:model_id, :color_id, :size_id, :quantity, :price)
    end
end
