require 'spec_helper'

describe "Tags" do
  describe "POST /tags" do
    let(:tag) { FactoryGirl.create(:tag)}
    subject { page }
    before { visit '/admin/exhibits/new' }
    let(:submit) { "Create Exhibit" }

    describe "without tags" do
      before do
        fill_in "Name",                   with: "Example Exhibit"
        fill_in "Registration number",    with: "002585"
      end

      it "should not create new tags" do
        expect { click_button submit }.not_to change(Tag, :count)
      end
    end

    describe "with present tag" do
      before do
        fill_in "Name",                   with: "Example Exhibit"
        fill_in "Registration number",    with: "002585"
        fill_in "Tags string",            with: tag.name
      end

      it "should not create new tags" do
        expect { click_button submit }.not_to change(Tag, :count)
      end
    end

    describe "with all new tags" do
      before do
        fill_in "Name",                   with: "Example Exhibit"
        fill_in "Registration number",    with: "002585"
        fill_in "Tags string",            with: "ExampleTag, ExampleTag2"
      end

      it "should create new tags" do
        expect { click_button submit }.to change(Tag, :count).by(2)
      end
    end

    describe "with new and present tags" do
      before do
        fill_in "Name",                   with: "Example Exhibit"
        fill_in "Registration number",    with: "002585"
        fill_in "Tags string",            with: "ExampleTag, #{tag.name}"
      end

      it "should create new tag" do
        expect { click_button submit }.to change(Tag, :count).by(1)
      end
    end
  end
end
