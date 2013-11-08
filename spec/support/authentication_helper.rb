module AuthenticationHelper

  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  def visit_new_user_invitation_path(admin = true)
    if admin
      user = FactoryGirl.create :user
    else
      user = FactoryGirl.create :user, admin: false
    end
    sign_in(user)
    visit new_user_invitation_path
  end

end
