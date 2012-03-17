# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(:email => "bobhope@gmail.com", :password => "gggggg", :password_confirmation => "gggggg")

d1 = user.decks.new
d1.deck_data = [Step.new]
d1.name = "Best Prezi Ever"
d1.deck_data[0].content = "Hello 1"
d1.save

d2 = user.decks.new
d2.deck_data = [Step.new]
d2.name = "Impressisessive"
d2.deck_data[0].content = "Hello 2"
d2.save