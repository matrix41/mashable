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
        channels = {}
# This EACH-DO loop is supposed to populate the channels hash 
        array.each do |article|
#        	puts "<><><><><>"
# Step 1: This line will print the current channel 
#        	puts article['channel']
# Step 2: This line will assign the channel to a temp variable 
#        	temp = article['channel'].chomp().to_s()
#            channels.add(article['channel']) if article.has_key? "#{article['channel']}"
#            channels = [ {:key => article['channel']} ]
# Step 3: This line will print the temp variable 
#            puts "temp = #{temp}"
# Step 4: In this IF-block, I am trying to add a new key to the hash 
#            if !channels.has_key? ( "#{temp}" )
            if !channels.has_key? ( article['channel'] )
#              puts "TT: #{temp}"
# Step 5: This line will assign a new key to the hash channels 
#              channels = { "#{article['channel']}" => nil }
              channels["#{article['channel']}"] = nil
            end
# Step 6: This line will print the current contents of hash channels
#            puts channels
        end

# Step 6: Print out all the channels in the hash channels 
        puts "----------------"
        channels.each do |key|
#        	puts key.class
            puts "<><><><><><><><>"
            puts key[0]
            puts "<><><><><><><><>"
#            puts channels.keys()
            array.each do |dustbunnies|
              stringA = dustbunnies['channel']
              # puts "Test0  #{stringA.class}"
              # puts "TestA  /#{dustbunnies['channel']}/"
              # puts "TestB  /#{key[0].chomp.to_s}/"
              stringB = key[0].chomp.to_s
              # puts "Test1  #{stringB.class}"
              # my_match = /dustbunnies['channel'].chomp.to_s/.match(stringB)
              # puts "my_match = #{my_match}"
              # puts "my_match = #{$&}"
              # puts "my_match = #{$1}"
              # if ( stringA =~ /^Watercooler$/ )
              #   puts " I got a match.  I got a match.  I got a match.  I got a match."
              # end
# The following IF-block compares the two strings containing channels and sees if they are a match or not. 
# THIS COMPARISON DID NOT WORK!!!!  WHY????
              # if ( stringA =~ /stringB/ )
              #   puts "Sovereign Class Battlestar Warp, Transwarp, FTL Capable; armed with KEWs, phasers, photon and quantum torpedos"
              #   puts "#{dustbunnies['title']}"
              # end

# The following IF-block compares the two strings containing channels and sees if they are a match or not.
              if [ stringA ].include?( stringB )
                puts "#{dustbunnies['title']}"
              end

            end
        end
        puts "----------------"


    end # end show_articles_grouped_by_channel function

    def show_author_plus_number_of_articles
        response = HTTParty.get('http://gist.githubusercontent.com/thebucknerlife/ce3598eb76deaec8ae4c/raw/ba25f9a6ed6d1fa9bbc3a41b1e85e8900d6d3e39/mashable.json', verify: false)

        hash = JSON.parse(response) 
#        puts "hash count = #{hash.count}"
        array = hash['new']
        author_hash = {}
 #       puts "author_hash count = #{author_hash.count}"
        array.each do |article|
#          puts article['author']
#          temp = article['author']
            if !author_hash.has_key? ( article['author'] )
#              author_hash["#{article['author']}"] = nil
              author_hash["#{article['author']}"] = 1
            else
#              puts "Sovereign Class Battlestar Warp, Transwarp, FTL Capable; armed with KEWs, phasers, photon and quantum torpedos"
#              puts "#{article['author']} = #{author_hash["#{article['author']}"]}"
              author_hash["#{article['author']}"] = author_hash["#{article['author']}"] + 1
            end
        end # end EACH-DO block
#        puts "author_hash count = #{author_hash.count}"

# Now print out entire author_hash
        puts "Author            # of articles"
        puts "----------------  -------------"
        author_hash.each do |key|
#          puts key[0], key[1]
          puts "#{key[0]}       #{key[1]}"
        end


    end # end show_author_plus_number_of_articles function 

    def show_authors_show_total_social_shares
    end # end show_authors_show_total_social_shares function 


end # end WorldCupStatus class 


show_stuff = Mashable.new
# show_stuff.show_title_show_short_url
puts "-------"
# show_stuff.show_article_show_total_social_shares
puts "-------"
# show_stuff.show_articles_grouped_by_channel
puts "-------"
show_stuff.show_author_plus_number_of_articles
puts "-------"
# show_stuff.show_authors_show_total_social_shares
puts "-------"



cool_stuff = Mashable.new


