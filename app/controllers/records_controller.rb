class RecordsController < ApplicationController
  def index

# 消費カロリーを計算する
    if @cal_intake_sum = Record.find_by(date: params[:date]).present?
      @cal_intake_sum = Record.find_by(date: params[:date]).foods.sum(:calorie)
    end
    
    # その日に食べたものを取得する。また,食べた日も
    if Record.find_by(date: params[:date]).present?
     @foods_name = Record.find_by(date: params[:date]).record_food.order(id: "ASC")
     @ate_day = Record.find_by(date: params[:date]).date
    end
    
    
    # 食べ物を編集するために中間のidが必要
    # @record_food_ids = RecordFood.find_by(date: params[:date])
    # @record_food_ids.each do |@record_food_id|
    #   @record_food_id



# すべての記録データを取得する。
    @records=Record.all.order(date: "DESC")
    @record = Record.find_by(date: params[:date])
    # プロテインを取得する
      @protain_ranking = rakuten_api_ranking
 
  # その日の記録をすべて取得する
      @results =  Result.where(date: params[:date])
    # 消費カロリー計算に使うデータを配列にいれた
      @double_array = @results.pluck(:weight,:minutes,:mets)
      @double_array.each do |a|
        a.each do |b|
          if b == nil
            redirect_to targets_path,notice: "mets,体重,日付,時間を入力してください"
            return 0
          end
        end
        end
        # 消費カロリーの計算をしている
      @cal_burn_sum = 0
      @double_array.each do |one|
        @cal_burn_sum += one[0]*one[1]*one[2]*1.05/60
      end

      
      @result = Result.find_by(date: params[:date])
      # 消費カロリー合計
    if @result
      # 消費-摂取カロリー
      @burn_intake_diff = 0
      @burn_intake_diff = @cal_intake_sum - @cal_burn_sum 
      @result.update_attributes(cal_burn_sum: @cal_burn_sum, cal_intake_sum: @cal_intake_sum,burn_intake_diff: @burn_intake_diff)
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
    
    @record = Record.find_by(date: record_params[:date])

    if @record.present?
      @record.update(record_params)
     
      if food_params.present?
        food_params[:food_ids].each do |food_id|
          @record_food = RecordFood.new(food_id:food_id)
          @record_food.record_id = @record.id
          @record_food.save
        end
        
        @record = Record.find_by(date: record_params[:date])
        @record_id = @record.id
        @recordfood = RecordFood.find_by(record_id: @record_id)
        # binding.pry
        if @recordfood
           @cal_intake_sum = @record.foods.sum(:calorie)
          # binding.pry
           @result = Result.find_by(date: record_params[:date])
           
            if @result.nil?
              Result.create(cal_intake_sum: @cal_intake_sum,date: record_params[:date])
            else
              @result.update_attribute(:cal_intake_sum,@cal_intake_sum)
            end
        else
          
        end
        
        
      end
      redirect_to tabs_path
    else
     @record_new = Record.create(record_params)
      if food_params.present?
        food_params[:food_ids].each do |food_id|
          @record_food = RecordFood.new(food_id:food_id)
          @record_food.record_id = @record.id
          @record_food.save
        end
      end
      redirect_to tabs_path
    end
  end
    # その日のrecordを見つける
    # @record=Record.find_by(date: record_params[:date]) 
    # if @record
    #   # レコードを保存する
    #   @record.update(record_params)
      
    #   if food_params.present?
    #     food_params[:food_ids].each do |food_id|
    #     # food_idを更新していく
    #       @record_food=RecordFood.new(food_id:food_id)
    #       @record_food.record_id=@record.id
    #       @record_food.save
    #     end
    #   end

    #   # 渡された日付の結果テーブルを探す
    #   @result = Result.where(date: record_params[:date])
    #   # もしデータが存在したら
    #   if @result
    #     # 繰り返し更新していく。体重だけを。
    #     @result.each do |one|
    #       one.update_attribute("weight",record_params[:weight])
    #     end
    #   end
      
    #   redirect_to records_path(date: record_params[:date]), notice: "投稿に成功しました"
      
    # else
    #   @record = Record.new(record_params)
    #   if @record.save
    #     food_params.each do |food_id|
    #       @record_food=RecordFood.new(food_id)
    #       @record_food.record_id=@record.id
    #       @record_food.save
    #     end
        
    #     @result = Result.create(weight: record_params[:weight])
        
    #     redirect_to records_path(date: record_params[:date]), notice: "投稿に成功しました"
        
    #   else
    #     render :new, notice: "投稿に失敗しました"
    #   end
    # end

  def update
    @record=Record.find_by(id:params[:id])
    @record.update(record_params)
    redirect_to tabs_path
  end
  
  def destroy
    content=Record.find(params[:id])
    content.destroy
    redirect_to tabs_path
    
  end

  
  def rakuten_api_ranking
    # ranking_by_genre = RakutenWebService::Ichiba::Genre[567603].ranking(:sex => 1)
    ranking_by_genre = RakutenWebService::Ichiba::Genre[567603].ranking
    return ranking_by_genre.first(3) 
  end
  
  
  def calorie_calculation
    # Record.find_by(date:params[:date])&.foods&.sum(:calorie)
  if params[:food_ids].present?
   Record.find_by(params[:date]).foods.sum[]
  end
    # foods.sum(:calorie)
    # binding.pry
      
  end
end
  
private
  def record_params
    params.require(:record).permit(:weight,:img,:bmi,:fat,:date,{images:[]})
  end
  
  def food_params
    params.permit(food_ids:[])
  end

