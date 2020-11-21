class TabsController < ApplicationController
def index
    @protain_ranking = rakuten_api_ranking
    @record = Record.find_by(date: params[:date])
end
  def rakuten_api_ranking
    # ranking_by_genre = RakutenWebService::Ichiba::Genre[567603].ranking(:sex => 1)
    ranking_by_genre = RakutenWebService::Ichiba::Genre[567603].ranking
    return ranking_by_genre.first(3) 
  end  
end
