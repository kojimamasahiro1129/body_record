class RecordsController < ApplicationController
  def index
    # paramsでひづけをわたす
    # if params[:date].present?
      @total_calories = Record.find_by(date: "2020-10-1").foods.sum(:calorie)
      # @total_calories = Record.find_by(date: params[:date]).foods.sum(:calorie)
    
      @records=Record.all.order(date: "DESC")
      # if @records.count==0
      #   @records=Record.all.order(date: "DESC")
      # end
    
      @foods=Food.all
      @protain_ranking = rakuten_api_ranking
      @a = []
      
      Food.all.each do |b|
        @a.push(4)
      end
      
      


  end

  def show
  end

  def edit
    @record=Record.find_by(id: params[:id])
  end

  def new
    @record=Record.new
    # @food_calorie=[]
    # @foods=Food.all
    
    # @foods.each do |food|
    #   @food_calorie << food
    # end
    @food=Food.new
  end
  
  def create
    
    @record=Record.find_by(date: record_params[:date]) 
    if @record
      food_params[:food_ids].each do |food_id|
        
          @record_food=RecordFood.new(food_id:food_id)
          @record_food.record_id=@record.id
          @record_food.save
        end
        
      @record.update(record_params)
      redirect_to records_path,success: "投稿に成功しました"
    else
      @record=Record.new(record_params)
      if @record.save
        
        food_params.each do |a|
          
          @record_food=RecordFood.new(a)
          @record_food.record_id=@record.id
          @record_food.save
        end
        
        redirect_to records_path,success: "投稿に成功しました"
      else
        flash.now[:danger]="投稿に失敗しました"
        render :new
      end
    end
  end

  def update
    @record=Record.find_by(id:params[:id])
    @record.update(record_params)
    redirect_to records_path
  end
  
  def destroy
    content=Record.find(params[:id])
    content.destroy
    redirect_to records_path
    
  end

  
  def rakuten_api_ranking
    # ranking_by_genre = RakutenWebService::Ichiba::Genre[567603].ranking(:sex => 1)
    ranking_by_genre = RakutenWebService::Ichiba::Genre[567603].ranking
    return ranking_by_genre.first(3) 
  end
  
  
  def calorie_calculation

    # Record.find_by(date:params[:date])&.foods&.sum(:calorie)
  if params[:food_ids].present?
    
    # params[:food_ids][0]=163
    # params[:food_ids][1]=169
    # params[:food_ids][2]=168
    # binding.pry
   Record.find_by(params[:date]).foods.sum[]
  end
    # foods.sum(:calorie)
    # binding.pry
      
  end
  
private
  def record_params
    params.require(:record).permit(:weight,:img,:bmi,:fat,:date,{images:[]})
    
  end
  
  def food_params
    params.permit(food_ids:[])
  end
end