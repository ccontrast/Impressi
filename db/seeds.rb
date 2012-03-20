# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(:email => "bobhope@gmail.com", :password => "gggggg", :password_confirmation => "gggggg")

d1 = user.decks.new
d1.name = "Template 1"
d1.deck_data = [{"class" => "step slide", "data-x" => "1000", "content" => "Slide 1"},
                {"class" => "step slide", "data-x" => "2000", "content" => "Slide 2"},
                {"class" => "step slide", "data-x" => "3000", "content" => "Slide 3"},
                {"class" => "step slide", "data-x" => "4000", "content" => "Slide 4"},
                {"class" => "step slide", "data-x" => "5000", "content" => "Slide 5"}]
d1.template = true
d1.save

d2 = user.decks.new
d2.name = "Template 2"
d2.deck_data = [{"class" => "step slide", "data-y" => "1000", "content" => "Slide 1"},
                {"class" => "step slide", "data-y" => "2000", "content" => "Slide 2"},
                {"class" => "step slide", "data-y" => "3000", "content" => "Slide 3"},
                {"class" => "step slide", "data-y" => "4000", "content" => "Slide 4"}, 
                {"class" => "step slide", "data-y" => "5000", "content" => "Slide 5"}]
d2.template = true
d2.save