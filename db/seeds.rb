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
d1.deck_data = [{'class' => "step slide", 'data-x' => "1000", 'content' => "Slide 1"},
                {'class' => "step slide", 'data-x' => "2000", 'content' => "Slide 2"},
                {'class' => "step slide", 'data-x' => "3000", 'content' => "Slide 3"},
                {'class' => "step slide", 'data-x' => "4000", 'content' => "Slide 4"},
                {'class' => "step slide", 'data-x' => "5000", 'content' => "Slide 5"}]
d1.template = true
d1.save

d2 = user.decks.new
d2.name = "Template 2"
d2.deck_data = [{'class' => "step slide", 'data-y' => "1000", 'content' => "Slide 1"},
                {'class' => "step slide", 'data-y' => "2000", 'content' => "Slide 2"},
                {'class' => "step slide", 'data-y' => "3000", 'content' => "Slide 3"},
                {'class' => "step slide", 'data-y' => "4000", 'content' => "Slide 4"}, 
                {'class' => "step slide", 'data-y' => "5000", 'content' => "Slide 5"}]
d2.template = true
d2.save

d3 = user.decks.new
d3.name = "Sphinx"
d3.deck_data = [{"class"=>"step", "data-rotate-x"=>"-90", "data-scale"=>"4", "data-x"=>"0", "data-y"=>"0", "data-z"=>"-1000", "id"=>"title", "content"=>"Slide 1"},
                {"class"=>"step", "data-rotate"=>"180", "data-rotate-y"=>"-30", "data-scale"=>"1", "data-x"=>"1000", "data-y"=>"800", "id"=>"features", "content"=>"Slide 2"},
                {"class"=>"step", "data-rotate-y"=>"30", "data-scale"=>"1", "data-x"=>"-1000", "data-y"=>"-800", "id"=>"installation", "content"=>"Slide 3"},
                {"class"=>"step", "data-scale"=>"1", "data-x"=>"0", "data-y"=>"-800", "data-z"=>"-200", "id"=>"setup", "content"=>"Slide 4"},
                {"class"=>"step", "data-rotate-y"=>"-30", "data-scale"=>"1", "data-x"=>"1000", "data-y"=>"-800", "id"=>"make", "content"=>"Slide 5"},
                {"class"=>"step", "data-rotate"=>"90", "data-rotate-y"=>"-30", "data-scale"=>"1", "data-x"=>"1000", "data-y"=>"0", "id"=>"requirements", "content"=>"Slide 6"},
                {"class"=>"step", "data-rotate"=>"-90", "data-rotate-y"=>"30", "data-scale"=>"1", "data-x"=>"-1000", "data-y"=>"0", "id"=>"license", "content"=>"Slide 7"},
                {"class"=>"step", "data-rotate"=>"-180", "data-rotate-y"=>"30", "data-scale"=>"1", "data-x"=>"-1000", "data-y"=>"800", "id"=>"links", "content"=>"Slide 8"},
                {"class"=>"step", "data-scale"=>"1", "data-x"=>"0", "data-y"=>"0", "data-z"=>"-200", "id"=>"contents", "content"=>"Slide 9"},
                {"class"=>"step", "data-scale"=>"3", "data-x"=>"0", "data-y"=>"0", "id"=>"overview", "content"=>"Slide 10"}]
d3.template = true
d3.save
