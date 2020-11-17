class CaloriesBurnedController < ApplicationController
    def new
       @result = Result.new
    end
    
    def create
        Result.create(result_params)
        redirect_to index_path
    end
end


  private
  def result_params
    params.require(menu_ids[])
  end 