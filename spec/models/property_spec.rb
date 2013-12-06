require 'spec_helper'

describe Property do
  it{ should validate_presence_of :title }
  it{ should validate_presence_of :value }
end
