class Admin::VersionsController < ApplicationController
  layout 'admin'
  before_action :find_parent

  def index
    @versions = @parent.versions
  end

  def revert
    @version = PaperTrail::Version.find(params[:id])

    if @version.reify
      @version.reify.save!
      redirect_to "#{url_for([:admin, PaperTrail::Version.last.item])}/versions"
      # redirect_to :back, :notice => "Undid #{@version.event}."
    else
      @version.item.destroy
      undo_link = view_context.link_to("Revert", {controller: 'admin/versions', action: 'revert', id: PaperTrail::Version.last.id}, {:method => :post})
      redirect_to '/admin', notice: "Item destroed #{undo_link}"
    end
  end

  private

    def find_parent
      params.each do |name, value|
        if name =~ /(.+)_id$/
          @parent = $1.classify.constantize.find(value)
          binding.pry
        end
      end
    end
end
