class Admin::UsersController <AdminController
  before_action :set_user, only: [:update,  :destroy]

  before_action do
    redirect_to admin_users_path unless  current_admin_user.admin?
  end

  def index
    @users = User.all
  end

  def edit
  end


  def update
    respond_to do |format|
      if @user.update(user_params)
      else
        redirect_to admin_users_path
      end
    end
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:admin, :password, :password_confirmation)
    end
end
