class Sentence < ApplicationRecord
  validates :content, :author, :image_id, :presence=> true
  belongs_to :story
  belongs_to :image

  def self.main_contributor
    authors = []
    sentences = Sentence.all
    sentences.each do |sentence|
      authors.push(sentence.author)
    end
    authors.group_by(&:itself).values.max_by(&:size).first
  end

end
