require 'rails_helper'

describe Sentence do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content }
  it { should belong_to :story }
  it { should belong_to :image }
end
