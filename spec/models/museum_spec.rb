require 'spec_helper'

#describe Museum do
#  pending "add some examples to (or delete) #{__FILE__}"
#end
#describe "should not save Museum without address"
#	Museum = Museum.new
#	assert !Museum.save	
#end
describe Museum do

  before { @Museum = Museum.new(name: "Example Museum", address: "Bud. 52 Vul.Volodymyra Velykogo, Lviv") }

  subject { @Museum }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:latitude) }
  it { should respond_to(:longitude) }

  it { should be_valid }

  describe "when address is not present" do
  	before { @Museum.address = " "}
  	it { should_not be_valid }
  end	
end


