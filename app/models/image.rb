class Image < ApplicationRecord
  validates :url, :presence => true
  has_many :sentences
end
