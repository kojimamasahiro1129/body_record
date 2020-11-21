class TargetsController < ApplicationController
    def index
        @record = Record.find_by(date: params[:date])

    end
    def new
        @target=Target.new
    end
    
    def edit
        @target=Target.first
    end
    
    def create
        if Target.create(target_params)
            redirect_to root_path
        else
            render :new
        end
    end
    
    def update
        # binding.pry
        if Target.first.update(target_params)
            redirect_to root_path
        else
            render new
        end
    end
    
private

def target_params
    params.require(:target).permit(:weight,:fat,:bmi,:img)
end
end