class ScoreboardController < ApplicationController
  
  def index
    @contestants = User.find( :all )
    @contestants.sort! { |a,b| -a.score <=> -b.score }
  end
  
  def show_contestants_pictures
    @current_contestant_id = params[ 'flickr_id' ]
  end
  
  def hide_contestants_pictures
    @current_contestant_id = params[ 'flickr_id' ]    
  end
  
end