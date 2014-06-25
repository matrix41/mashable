require 'httparty'
require 'JSON'

class Mashable
    def show_title_show_short_url
#            response = HTTParty.get('http://mashable.com/stories.json?new_per_page=10')
        response = HTTParty.get('http://gist.githubusercontent.com/thebucknerlife/ce3598eb76deaec8ae4c/raw/ba25f9a6ed6d1fa9bbc3a41b1e85e8900d6d3e39/mashable.json', verify: false)

#                response.parsed_response
#                monkey = JSON.parse(response) 
        hash = JSON.parse(response) 
        array = hash['new']

        array.each do |article|
          puts article['title'], article['short_url']
        end # end EACH-DO block
    end # end show_title_show_short_url function 


    def show_article_show_total_social_shares
        response = HTTParty.get('http://gist.githubusercontent.com/thebucknerlife/ce3598eb76deaec8ae4c/raw/ba25f9a6ed6d1fa9bbc3a41b1e85e8900d6d3e39/mashable.json', verify: false)

        hash = JSON.parse(response) 
        array = hash['new']

        array.each do |article|
          # all_social = article['shares']
          # all_social.each do |tam|
          # 	puts tam
          # end
          puts "#{article['title']} : #{article['shares']['total']} total shares\n";
#          puts article['shares']
		end
    end # end show_article_show_total_social_shares function 


    def show_articles_grouped_by_channel
        response = HTTParty.get('http://gist.githubusercontent.com/thebucknerlife/ce3598eb76deaec8ae4c/raw/ba25f9a6ed6d1fa9bbc3a41b1e85e8900d6d3e39/mashable.json', verify: false)

        hash = JSON.parse(response) 
        array = hash['new']

        array.each do |article|
        	puts article['channel']
        end

    end # end show_articles_grouped_by_channel function

    def show_author_plus_number_of_articles
    end # end show_author_plus_number_of_articles function 

    def show_authors_show_total_social_shares
    end # end show_authors_show_total_social_shares function 


end # end WorldCupStatus class 


show_stuff = Mashable.new
# show_stuff.show_title_show_short_url
puts "-------"
# show_stuff.show_article_show_total_social_shares
puts "-------"
show_stuff.show_articles_grouped_by_channel
puts "-------"



cool_stuff = Mashable.new


