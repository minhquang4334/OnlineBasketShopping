class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]

  def index
    @models = Model.all
  end

  def create
    @model = Model.new(model_params)
    if @model.save
      flash[:success] = "Created success"
      redirect_to models_path
    else
      render :new
    end
  end

  def show
  end

  def new
    @model = Model.new()
  end

  def edit
  end

  def update
    if @model.update_attributes model_params
      flash[:success] = "Updated success"
      redirect_to @model
    else
      render :edit
    end
  end

  def destroy
    @model.destroy
    flash[:success] = "Deleted success"
    redirect_to request.referrer || root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:name, :description, :image)
    end
end
