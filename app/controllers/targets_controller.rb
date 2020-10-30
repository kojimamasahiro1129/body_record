class TargetsController < ApplicationController
    def new
        @target=Target.new
    end
    
    def edit
        @target=Target.first
    end
    
    def create
        if Target.create(target_params)
            redirect_to records_path,success: "投稿に成功しました"
        else
            render :new
        end
    end
    
    def update
        if Target.first.update(target_params)
            redirect_to records_path,success: "投稿に成功しました"
        else
            render new
        end
    end
    
private

def target_params
    params.require(:target).permit(:weight,:fat,:bmi,:img)
end
end