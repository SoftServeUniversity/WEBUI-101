require 'spec_helper'

describe Biography do
  it { should have_and_belong_to_many(:exhibits) }
  it { should validate_uniqueness_of(:name)}
  it { should validate_uniqueness_of(:description)}
end