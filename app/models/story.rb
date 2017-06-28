class Story < ApplicationRecord
  validates :title, :presence => true
  has_many :sentences

  scope :most_sentences, -> {(
    select("stories.title, stories.id, count(sentences.id) as sentences_count")
    .joins(:sentences)
    .group("stories.id")
    .order("sentences_count DESC")
    .limit(3)
    )}

end
