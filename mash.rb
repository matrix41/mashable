require 'httparty'
require 'JSON'

class Mashable
        def print_status
#                response = HTTParty.get('http://mashable.com/stories.json?new_per_page=10')
                response = HTTParty.get('http://gist.githubusercontent.com/thebucknerlife/ce3598eb76deaec8ae4c/raw/ba25f9a6ed6d1fa9bbc3a41b1e85e8900d6d3e39/mashable.json', verify: false)

#                response.parsed_response
#                monkey = JSON.parse(response) 
                hash = JSON.parse(response) 
                array = hash['new']

                array.each do |article|
                  puts article['title'], article['short_url']
                  puts article['shares']['facebook']

                end # end EACH-DO block
        end # end print_status function 
end # end WorldCupStatus class 


show_stuff = Mashable.new
show_stuff.print_status

cool_stuff = Mashable.new


