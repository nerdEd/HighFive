class User < ActiveRecord::Base
  has_many :photos
  
  def calculate_score
    photos.size
  end
  
end