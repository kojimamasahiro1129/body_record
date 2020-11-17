class FoodsController < ApplicationController
  
  def edit
    @foodrecord = RecordFood.find(params[:id]) 
  end

  def update
    @recordfood =  RecordFood.find(params[:id])
    @recordfood.update_attributes(food_id: params[:record_food][:food_id])
    redirect_to records_path(date: params[:date])
  end

  def destroy
    @recordfood = RecordFood.find(params[:id])
    @date = @recordfood.record.date 
    @recordfood.destroy
    redirect_to records_path(date: @date)
  end
end
