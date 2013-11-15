# == Schema Information
#
# Table name: exhibits
#
#  id                             :integer          not null, primary key
#  name                           :string(255)
#  registration_number            :string(255)
#  date_of_receipt                :date
#  fund_creator                   :string(255)
#  opportunity_for_transportation :string(255)
#  the_degree_of_preservation     :string(255)
#  authenticity                   :boolean
#  the_electronic_version         :boolean
#  size                           :string(255)
#  description                    :text
#  created_at                     :datetime
#  updated_at                     :datetime
#

require 'spec_helper'

describe Exhibit do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:registration_number) }
end
