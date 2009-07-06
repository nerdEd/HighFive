require 'flickr_client'
require 'pp'

namespace :highfive do
  
  desc 'Update all photos and their associated records'
  task :update_photos => :environment do         
    
    flickr_client = FlickrClient::Client.new( APP_CONFIG[ 'flickr_key' ] )
    photos = flickr_client.photos( APP_CONFIG[ 'target_tag' ] )
    
    photos.each do | photo |
      flickr_client.comments( photo )
      photo.save
      if( photo.user == nil )
        user = flickr_client.user( photo.user_id )
        user.photos << photo
      end
    end
    
  end
  
  desc 'Updates the calculated scores for all users'
  task :score => :update_photos do
    User.find( :all ).each do | user |
      user.score = user.calculate_score
      user.save
    end
  end
  
end