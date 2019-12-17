
module Api
  class ModelsController < ApplicationController
    include ActionController::MimeResponds
    def index
      @posts = Model.paginate :page => params[:page], :per_page => 9

      render :json => {
          :current_page => @posts.current_page,
          :per_page => @posts.per_page,
          :entries => @posts
      }
    end

    def info
      @model = Model.find_by id: params[:id]
      @model_details = @model.detail_models
      render :json => {
          :model => @model,
          :model_detail => @model_details
      }
    end

    def size_color 
      @sizes = Size.all
      @colors = Color.all 
      render :json => {
        :sizes => @sizes,
        :colors => @colors
      }
    end

    def model_analystic 
      @model_categories = {}
      models = Model.all
      models.each_with_index do |model, index|
        count = 0
        model.detail_models.each do |detail_model|
          qty = detail_model.order_details.recent.count
          count += qty
        end 
        @model_categories[index] = {"name": model.name, "qty": count}
      end
      render :json => @model_categories
    end
  end
end