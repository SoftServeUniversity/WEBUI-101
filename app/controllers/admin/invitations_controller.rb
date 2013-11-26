class Admin::InvitationsController < Devise::InvitationsController
  def new
    if current_admin_user.admin?
      super
    else
      flash[:warning] = 'You are not allowed to invite new users.'
      redirect_to admin_root_path
    end
  end
end

