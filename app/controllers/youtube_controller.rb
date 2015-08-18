class YoutubeController < ApplicationController
    
   
    
    def index
       
    end
    
    def search
        query = params[:query]
        youtube = Youtube.new
        @results = youtube.retrieve_search_result(query)
    end
    
end
