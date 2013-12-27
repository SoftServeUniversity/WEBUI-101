module VersionsHelper
  def change_set_value(val)
    if val.to_s.empty?
      'No previous value.'
    else
      val
    end
  end
end
