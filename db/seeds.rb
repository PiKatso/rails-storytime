Story.destroy_all

10.times do |i|
  story = Story.create!(title: Faker::Hipster.word)

  5.times do |i|
    sentence = story.sentences.create!(content: Faker::Hipster.sentence,
                                      author: Faker::TwinPeaks.character)

    # 1.times do |i|
    #     sentence.image.create!(url: "http://lorempixel.com/400/200/")
    # end
  end
end


p "Created #{Story.count} stories"


# once initially set up/to edit must run 'rake db:setup'
# also 'rake db:test:prepare'
