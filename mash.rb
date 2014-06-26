require 'httparty'
require 'JSON'

class Mashable
    def show_title_show_short_url
#            response = HTTParty.get('http://mashable.com/stories.json?new_per_page=10')
        response = HTTParty.get('http://gist.githubusercontent.com/thebucknerlife/ce3598eb76deaec8ae4c/raw/ba25f9a6ed6d1fa9bbc3a41b1e85e8900d6d3e39/mashable.json', verify: false)

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
          puts "#{article['title']} : #{article['shares']['total']} total shares\n";
        end
    end # end show_article_show_total_social_shares function 


    def show_articles_grouped_by_channel
        response = HTTParty.get('http://gist.githubusercontent.com/thebucknerlife/ce3598eb76deaec8ae4c/raw/ba25f9a6ed6d1fa9bbc3a41b1e85e8900d6d3e39/mashable.json', verify: false)

        hash = JSON.parse(response) 
        array = hash['new']
        channels = {}
# This EACH-DO loop will populate the channels hash with a unique channel
        array.each do |article|
# In this IF-block, I am trying to add a new key to the hash 
            if !channels.has_key? ( article['channel'] )
# This line will assign a new key to the hash channels 
#             channels = { "#{article['channel']}" => nil }
              channels["#{article['channel']}"] = nil
            end
        end

# The nested EACH-DO loop below will loop through each unique channel.  
# At each channel, the algorithm will loop through the entire mashable 
# array hash, looking for a match to channel.  When there is a match, 
# it will print out an article title. 
        puts "----------------"
        channels.each do |key|
            puts "<><><><><><><><>"
            puts key[0]
            puts "<><><><><><><><>"
            array.each do |dustbunnies|
              stringA = dustbunnies['channel']
              stringB = key[0].chomp.to_s
# The following IF-block compares the two strings containing 
# channels and sees if they are a match or not. 
# THIS COMPARISON DID NOT WORK!!!!  WHY????
              # if ( stringA =~ /stringB/ )
              #   puts "#{dustbunnies['title']}"
              # end

# The following IF-block compares the two strings containing 
# channels and sees if they are a match or not.
              if [ stringA ].include?( stringB )
                puts "#{dustbunnies['title']}"
              end
            end
        end
    end # end show_articles_grouped_by_channel function


    def show_author_plus_number_of_articles
        response = HTTParty.get('http://gist.githubusercontent.com/thebucknerlife/ce3598eb76deaec8ae4c/raw/ba25f9a6ed6d1fa9bbc3a41b1e85e8900d6d3e39/mashable.json', verify: false)

        hash = JSON.parse(response) 
        array = hash['new']
        author_hash = {}

# The EACH-DO loop below will loop through all the authors in the 
# mashable hash.  The IF-block will check if that author name is 
# already in author_hash.  If it is not, then add the author as 
# a new key and give it value = 1.  If it is, then simply add 1 
# to the existing value associated with that author.    
        array.each do |article|
            if !author_hash.has_key? ( article['author'] )
              author_hash["#{article['author']}"] = 1
            else
              author_hash["#{article['author']}"] = author_hash["#{article['author']}"] + 1
            end
        end # end EACH-DO block

# Now print out entire author_hash
        puts "Author            # of articles"
        puts "----------------  -------------"
        author_hash.each do |key|
          puts "#{key[0]}       #{key[1]}"
        end
    end # end show_author_plus_number_of_articles function 


    def show_authors_show_total_social_shares
        response = HTTParty.get('http://gist.githubusercontent.com/thebucknerlife/ce3598eb76deaec8ae4c/raw/ba25f9a6ed6d1fa9bbc3a41b1e85e8900d6d3e39/mashable.json', verify: false)

        hash = JSON.parse(response) 
        array = hash['new']
        author_hash = {}

# The EACH-DO loop below will loop through all the authors in the 
# mashable hash.  The IF-block will check if that author name is 
# already in author_hash.  If it is not, then add the author as 
# a new key and assign it a hash value equal to the total social 
# shares.  If it is, then simply add the total social shares to 
# the existing value associated with that author.    
        array.each do |article|
            if !author_hash.has_key? ( article['author'] )
              author_hash["#{article['author']}"] = article['shares']['total']
            else
              author_hash["#{article['author']}"] = author_hash["#{article['author']}"] + article['shares']['total']
            end
        end # end EACH-DO block

# Now print out entire author_hash
        puts "Author            Total # of shares"
        puts "----------------  -----------------"
        author_hash.each do |key|
          puts "#{key[0]}       #{key[1]}"
        end
    end # end show_authors_show_total_social_shares function 
end # end Mashable class 


# Instantiate new object from Mashable class 
show_stuff = Mashable.new

# Begin loop
begin
  puts " "
  puts "+=============================================================+"
  puts "|                        Mashable Menu                        |" 
  puts "+=============================================================+"
  puts "|  1. Show each article title + short URL                     |"
  puts "|  2. Show each article and the total social share            |"
  puts "|  3. Show articles grouped by channel                        |"
  puts "|  4. Show each author and the numbers of articles they wrote |"
  puts "|  5. Show authors by aggregate total social shares           |"
  puts "|  6. Exit                                                    |"
  puts "+=============================================================+"
  puts " "
  user_input = gets.chomp.to_i()
  case user_input
  when 1
#    puts "It's 1"
    show_stuff.show_title_show_short_url
  when 2
#    puts "It's 2"
    show_stuff.show_article_show_total_social_shares
  when 3
#    puts "It's 3"
    show_stuff.show_articles_grouped_by_channel
  when 4
#    puts "It's 4"
    show_stuff.show_author_plus_number_of_articles
  when 5
#    puts "It's 5"
    show_stuff.show_authors_show_total_social_shares
  when 6
#    puts "It's 6"
    break # exit out of program 
  else
    puts "You gave me #{user_input} -- I have no idea what to do with that."
    break # exit out of program 
  end
end while user_input != 6

