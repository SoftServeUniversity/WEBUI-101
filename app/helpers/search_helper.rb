module SearchHelper
  def partial_for(found_result)
    "search/#{found_result.class.to_s.downcase}"
  end
end
