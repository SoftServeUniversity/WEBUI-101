class Users::InvitationsController < Devise::InvitationsController
  def new
    if current_user.admin?
      super
    else
      flash[:error] = 'You are not allowed to invite new users.'
      redirect_to root_path
    end
  end
end

