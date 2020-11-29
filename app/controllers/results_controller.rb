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
    record = Record.find_by(date: params[:menu_date])
    if record.nil?
        # redirect_to(tabs_path(anchor: 'wei')) and return
        flash.now[:alert] = '体重などの記録を入力してください。'
        # render template: "records/new"
        # redirect_to(new_record_path) and return
        redirect_to new_record_path,notice:"体重などの記録を入力してください。"
        return
    end
     @cal_intake_sum = record.foods.sum(:calorie)

     calories = params[:menu_ids]
        
      results = calories.map do |id|
         calorie = CaloriesBurned.find(id)
         
        #  result = Result.find_by(date: params[:menu_date])
        result_params = {
            "name" => calorie.name,
            "level" => calorie.level,
            "sense" => calorie.sense,
            "mets" => calorie.mets,
            "weight" => record.weight,
            "minutes" => 5,
            "date" => params[:menu_date],
            #  "cal_burn_sum" => result.cal_burn_sum,
             "cal_intake_sum" => @cal_intake_sum,
            #  "burn_intake_diff" => result.burn_intake_diff
        }
             
        Result.create(result_params)
     end
    #  puts results
     
     @cal_burn_sum = 0
     results = Result.where(date: params[:menu_date])
     
     results.each do |result|
         
         min = result.minutes
         weight = result.weight
         mets = result.mets
         if min.present? && weight.present? && mets.present?
            @cal_burn_sum += min*weight*mets*1.05/60
         end
     end
     
   
    @cal_intake_sum = Record.find_by(date: params[:menu_date]).foods.sum(:calorie)

     results.each do |result|
         result.update_attribute(:cal_burn_sum,@cal_burn_sum )
     end
     

     
    results.each do |result|
     if result.cal_burn_sum && result.cal_intake_sum
         diff = result.cal_intake_sum - result.cal_burn_sum
         result.update_attribute(:burn_intake_diff, diff)
     end
    end
    
    redirect_to tabs_path(anchor: 'traning')
    
  end
  
  def update
      @result = Result.find(params[:id])
      @result.update(result_edit_params)
      redirect_to tabs_path(anchor: 'traning')
  end
  
  def destroy
     @result = Result.find(params[:id])
     @result.destroy
     flash[:success] = '削除しました。'
     redirect_to tabs_path(anchor: 'traning')
     
  end
  

  
  
end



private

def result_edit_params
    params.require(:result).permit(:name,:mets,:weight,:date,:sense,:level,:minutes)
end