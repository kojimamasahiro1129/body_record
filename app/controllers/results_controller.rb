class ResultsController < ApplicationController
  def index
   @results = Result.order(:id)
    @result = Result.find_by(date: params[:date])
  end

  def new
  end

  def edit
      @result_edit = Result.find(params[:id])
      @result = Result.new
      @caloriesburneds_name = CaloriesBurned.select("name")
      @caloriesburneds_level = CaloriesBurned.select("level").limit(3)
      @caloriesburneds_sense = CaloriesBurned.select("sense").limit(3)
  end
  
  def create
     calories = params[:menu_ids]
     calories.each do |id|
         calorie = CaloriesBurned.find(id)
         
         record = Record.find_by(date: params[:menu_date])
         weight = record ? record.weight : nil 
         result_params = {
             "name" => calorie.name,
             "level" => calorie.level,
             "sense" => calorie.sense,
             "mets" => calorie.mets,
             "weight" => weight,
             "minutes" => 0,
             "date" => params[:menu_date]
         }
         Result.create(result_params)
    end
    
    redirect_to records_path
    
  end
  
  def update
      @result = Result.find(params[:id])
      @result.update(result_edit_params)
      redirect_to results_path
  end
  
  def destroy
     @result = Result.find(params[:id])
     @result.destroy
     flash[:success] = '削除しました。'
     redirect_to results_path
     
  end
end

private

def result_edit_params
    params.require(:result).permit(:name,:mets,:weight,:date,:sense,:level,:minutes)
end