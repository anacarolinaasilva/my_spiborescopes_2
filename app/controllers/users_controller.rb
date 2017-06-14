class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update] #allow user to edit his profile only
  before_action :admin_user, only: [:destroy]

  def index
   @users = User.where(activated: FILL_IN).paginate(page: params[:page])
  end

  def new
   @user = User.new
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless FILL_IN
    #@microposts = @user.microposts.paginate(params[:page])
  end

  #Create User:
    def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

   #Update User:
   def edit
   end

  def update
    if @user.update_attributes(user_params)
       flash[:success] = "Profile Updated"
       redirect_to @user
    else
      render 'edit'
    end
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:sucess] = "User Deleted"
    redirect_to users_url
  end

   private
     #Strong parameters, :admin is not on the list
     def user_params
       params.require(:user).permit(:name, :first_name, :last_name, :email,
                                              :password, :password_confirmation)
     end

     #Before Filters!
     #confirms a logged-in user.
     def logged_in_user
        unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
     end

     #confirms the correct user.
     def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
     end

     #confirms an admin user.
     def admin_user
       redirect_to(root_url) unless current_user.admin?
    end

end
