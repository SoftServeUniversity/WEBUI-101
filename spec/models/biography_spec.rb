require 'spec_helper'

describe Biography do
  it { should have_and_belong_to_many(:exhibits) }
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:description)}
end
