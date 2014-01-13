class MainPageController < ApplicationController
  def index
    main_page_tags = Property.find_by_title('mainPageTags').value.split(",")
    # tags = Tag.where(name: main_page_tags)
    @exhibits = Exhibit.joins(:tags, :pictures).where(tags: {name: main_page_tags}).limit(12).order('RANDOM()')
  end
end
