class Admin::VersionsController < ApplicationController
  layout 'admin'
  before_action :find_parent

  def index
    @versions = @parent.versions
    binding.pry
  end

  def revert
    @version = PaperTrail::Version.find(params[:id])

    if @version.reify
      @version.reify.save!
    else
      @version.item.destroy
    end
    redirect_to :back, :notice => "Undid #{@version.event}."
  end

  private

    def find_parent
      params.each do |name, value|
        if name =~ /(.+)_id$/
          @parent = $1.classify.constantize.find(value)
        end
      end
    end
end
