class RegistrationsController < Devise::RegistrationsController

  def update
    @user = User.find(current_user.id)

    if @user.update_without_current_password(params[:user])
      sign_in @user, bypass: true
      set_flash_message :notice, :updated
      redirect_to after_update_path_for(@user)
    else
      render 'edit'
    end
  end
end
