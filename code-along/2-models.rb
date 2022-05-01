# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert new rows in companies table. YO:all is a method that's to read all of the rows from this table.
                                          #And I want to count them. In my cheat sheet, I can see this.
puts "There are #{Company.all.count} companies"

new_company = Company.new
#puts new_company.inspect
new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https://www.apple.com"
new_company.save
puts "There are #{Company.all.count} companies"

new_company2 = Company.new
new_company2["name"] = "Amazon"
new_company2["city"] = "Seattle"
new_company2["state"] = "WA"
new_company2.save

puts "There are #{Company.all.count} companies"

#puts "What are you? #{new_company.class}"

puts "There are #{Company.all.count} companies"

new_company3 = Company.new
new_company3["name"] = "Twitter"
new_company3["city"] = "San Francisco"
new_company3["state"] = "CA"
new_company3.save

puts "There are #{Company.all.count} companies"

# 3. query companies table to find all row with California company

all_companies = Company.all
#puts all_companies.inspect
#yo: so It's an array
puts all_companies[0].inspect

# All rows in companies table where state is "CA"
california_companies = Company.where({ "state" => "CA" })
# SELECT * FROM companies WHERE state = "CA"
puts california_companies.inspect

puts "There are: #{california_companies.count} companies in cali" # companies in cali: 2

# 4. query companies table to find single row for Apple
#apple = Company.where({ "name" => "Apple" })[0]
apple = Company.find_by({ "name" => "Apple" })
puts apple.inspect

# 5. read a row's column value
#It's a hashe
puts apple["url"]

# 6. update a row's column value

amazon = Company.find_by({ "name" => "Amazon" })
amazon["url"] = "https://www.amazon.com/"
# OR
# amazon.url = "https://www.amazon.com/"
amazon.save

# 7. delete a row
twitter = Company.find_by({ "name" => "Twitter" })
twitter.destroy

# How many rows are in the companies table?
puts "companies: #{Company.all.count}" # companies: 2


