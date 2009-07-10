require 'rubygems'
require 'httparty'
require 'open-uri'
require 'rexml/document'

module FlickrClient
  
  class Client
  
    include HTTParty
    
    base_uri "http://api.flickr.com/services/rest/"
    
    def initialize( api_key )
      
      @api_key = api_key
      self.class.default_params :api_key => @api_key
      
    end
    
    def get( options={} )
      
      self.class.get( '', options )
      
    end
    
    def photos( tags = "" )
      
      get( :query => { :method => "flickr.photos.search", :tags => tags } )[ 'rsp' ][ 'photos' ][ 'photo' ].each do | photo_properties |
        if( !Photo.exists?( :flickr_id => photo_properties[ 'id' ] ) )
          Photo.create( :flickr_id => photo_properties[ 'id' ], :title => photo_properties[ 'title' ], :user_id => photo_properties[ 'owner' ] )
        end
      end
      
      Photo.find( :all )
    end
    
    def user( user_id )
      
      user_properties = get( :query => { :method => "flickr.people.getInfo", :user_id => user_id } )[ 'rsp' ][ 'person' ]
      if( !User.exists?( :flickr_id => user_properties[ 'id' ] ) )
        User.create( :flickr_id => user_properties[ 'id' ], :username => user_properties[ 'username' ], :profile_url => user_properties[ 'profileurl' ] )
      else
        User.find_by_flickr_id( user_properties[ 'id' ] )
      end
      
    end
    
    # Currently doing this manually because of a bug in the way HTTParty parses element attributes
    def comments( photo )
      
      open( 'http://www.flickr.com/services/rest/?method=flickr.photos.comments.getList&api_key=' + @api_key +'&photo_id=' + photo.flickr_id ) do | f |
          doc = REXML::Document.new f.read

          doc.elements.each( "rsp/comments/comment" ) do | comment_element |
            if( !Comment.exists?( :flickr_id => comment_element.attributes[ 'id' ] ) ) 
              photo.comments.build(
                :flickr_id => comment_element.attributes[ 'id' ],
                :author => comment_element.attributes[ 'author' ],
                :author_name => comment_element.attributes[ 'authorname' ],
                :permalink => comment_element.attributes[ 'permalink' ],
                :text => comment_element.text)   
            end
          end
      end
      
    end
    
  end

end