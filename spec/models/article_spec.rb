require 'spec_helper'

describe Article do
  it { should validate_presence_of(:title) }
end
