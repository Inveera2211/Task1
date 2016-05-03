class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

# def newpass
# end
 def update
   #byebug
    @user = current_user    
    #byebug
    if @user.valid_password?(params[:user][:password]) and !params[:user][:new_password].blank?
     # byebug
      if  @user.update(password:params[:user][:new_password])
        #sign_out @user
        #reset_session
        flash[:success] = "Profile updated."
        redirect_to root_url
      else
        @title = "Edit user"
        render 'edit'
      end
    else
      #byebug
      if @user.update(email:params[:user][:email], avatar:params[:user][:avatar])
        #sign_out @user
        flash[:success] = "Profile updated."
        redirect_to root_url
      else
        @title = "Edit user"
        render 'edit'
      end
    end
  end

 # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected
   def configure_account_update_params
     params.require(:user).permit(:email, :password,:new_password, :avatar)
   end

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
   

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
