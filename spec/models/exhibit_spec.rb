require 'spec_helper'

describe Exhibit do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:registration_number) }
  it { should have_and_belong_to_many(:tags)}
end
