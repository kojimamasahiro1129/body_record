class GymListsController < ApplicationController
  def index
    @calories_burneds = CaloriesBurned.all
  end
  
  def new
    @caloriesburnd = CaloriesBurned.new 
  end
  def 

  def edit
    @caloriesburnd = CaloriesBurned.find(params[:id])
    
  end

  def create
    if CaloriesBurned.create(gym_params)
      redirect_to gym_lists_path
    end
  end
  def update
  end
  
  def destroy
  end

end

private

def gym_params
  params.require(:calories_burneds).permit(:name,:mets)
end