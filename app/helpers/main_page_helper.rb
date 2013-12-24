module MainPageHelper
  def partial_for(item)
    "main_page/#{item.class.to_s.downcase}"
  end
end
