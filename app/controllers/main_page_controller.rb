class MainPageController < ApplicationController
  def index
    exhibits = []
    main_page_tags = Property.find_by_title('mainPageTags').value
    tags=main_page_tags.split(",")
=begin
    tags.cycle do |tag|
      exhibits<<Tag.find_by_name(tag).select{|e| e.pictures.any?}.sample
       end
=end
  end
end
