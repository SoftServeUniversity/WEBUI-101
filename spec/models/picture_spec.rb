require 'spec_helper'

describe Picture do
  it { should belong_to(:exhibit) }
  it { should validate_presence_of(:image) }
end
