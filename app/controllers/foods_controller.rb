class FoodsController < ApplicationController
  
  def edit
    @foodrecord = RecordFood.find(params[:id]) 
  end

  def update
    @recordfood =  RecordFood.find(params[:id])
    @recordfood.update_attributes(food_id: params[:record_food][:food_id])
    redirect_to tabs_path
  end

  def destroy
    @recordfood = RecordFood.find(params[:id])
    @recordfood.destroy
    redirect_to tabs_path
  end
end
