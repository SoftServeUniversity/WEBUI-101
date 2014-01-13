class Admin::VersionsController < AdminController
  layout 'admin'
  before_action :find_parent

  def index
    @versions = @parent.versions
  end

  def revert
    @version = PaperTrail::Version.find(params[:id])

    if @version.reify
      @version.reify.save!
      redirect_to "#{url_for([:admin, PaperTrail::Version.last.item])}/versions", notice: "Undid #{@version.event}."
    else
      @version.item.destroy
      undo_link = view_context.link_to("Revert", revert_admin_version_path(PaperTrail::Version.last), method: :post)
      redirect_to '/admin', notice: "#{@version.item.class.to_s} was destroyed. To restore deleted item use the following link #{undo_link}."
    end
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
