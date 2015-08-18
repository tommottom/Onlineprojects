class Youtube < ActiveRecord::Base
    
    def retrieve_search_result(query)
        mechanize = Mechanize.new { |agent|
            agent.user_agent_alias = 'Mac Safari'
        }

        search_page = mechanize.get('https://www.youtube.com')
        search_result = search_page.form_with(:id => 'masthead-search') do |search_form|
            search_form['search_query'] = query
        end.submit

        results = Array.new
        search_result.search('div.yt-lockup.yt-lockup-tile.yt-lockup-video.vve-check.yt-uix-tile').each do |div|
            result = Hash.new
            result['text'] = div.css('a.yt-uix-sessionlink.yt-uix-tile-link.yt-ui-ellipsis.yt-ui-ellipsis-2.spf-link').text
            result['link'] = div.css('a.yt-uix-sessionlink.yt-uix-tile-link.yt-ui-ellipsis.yt-ui-ellipsis-2.spf-link').attribute('href').value
            result['image'] = div.css('div.yt-thumb.video-thumb img').attribute('src').value
            results << result
        end
        return results
    end
end


 
 

