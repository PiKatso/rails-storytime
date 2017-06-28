Story.destroy_all
Image.destroy_all

image_list = [
  ["http://gatesthecomic.com/wp-content/uploads/2011/02/moebius1city_of_fire-hal-hefner-gates-the-comic-heavy-metal.jpg"],
  ["http://cdn8.openculture.com/wp-content/uploads/2015/03/MoebiusJourney.jpg"],
  ["https://i0.wp.com/www.iamag.co/features/itsart/wp-content/uploads/2016/02/The-Art-of-Moebius34.jpeg?w=495&h=349&crop"],
  ["http://cdn8.openculture.com/wp-content/uploads/2015/03/MoebiusGondola.jpg"],
  ["http://latimesherocomplex.files.wordpress.com/2011/03/moebius3.jpg?w=600&h=460"],
  ["https://upload.wikimedia.org/wikipedia/en/1/12/Blueberry_NezCasse.jpg"],
  ["http://www.cvltnation.com/wp-content/uploads/2014/11/doorofperception.com-moebius-color-47.jpg"],
  ["http://www.graphicine.com/wp-content/uploads/2015/01/Jean_Giraud_xyse9mi161qbyi80o10_1280.jpg"],
  ["http://mindlessones.com/wp-content/uploads/2012/04/HermesMoebius04.jpg"]
]

image_list.each do |url|
  Image.create(url: url)
end

10.times do |i|
  story = Story.create!(title: Faker::Hipster.word)

  5.times do |i|
    sentence = story.sentences.create!(content: Faker::Hipster.sentence,
                                      author: Faker::TwinPeaks.character,
                                      image_id: Image.order("RANDOM()").first.id.to_i)

    # 1.times do |i|
    #     sentence.image.create!(url: "http://lorempixel.com/400/200/")
    # end
  end
end


p "Created #{Story.count} stories"


# once initially set up/to edit must run 'rake db:setup'
# also 'rake db:test:prepare'
