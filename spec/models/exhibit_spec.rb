require 'spec_helper'

describe Exhibit do
  it { should have_many(:pictures) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:registration_number) }
end
