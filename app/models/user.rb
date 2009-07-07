class User < ActiveRecord::Base
  has_many :photos
  
  def calculate_score
    total_score = photos.size
    photos.each do | photo |
      photo.comments.each do | comment |
        if( comment.author_name = APP_CONFIG[ 'admin' ] )
          mods = comment.text.scan( /\[[+-]\d*\]/ )
          if( !mods.empty? )
            mods.each do | mod |
              total_score += mod.gsub( /[\[\]]/, '' ).to_i
            end
          end
        end
      end
    end
    total_score
  end
  
end