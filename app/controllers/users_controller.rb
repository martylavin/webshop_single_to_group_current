

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :mail]
  before_action :authorize

  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    @users = User.order(params[:sort])
  end

  def mail
    UserMailer.contactus(@user).deliver
    redirect_to @user, notice: 'Email was sent to one single user'
  end

  
  def spam
    @users = User.all
    UserMailer.newsletter(@users).deliver
    redirect_to users_path, notice: 'Email was sent to all Legion Post 854 members'
  end


  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    #@user = current_admin.users.build.new(user_params)

    respond_to do |format|
      if @user.save
        #@users = User.all
        #UserMailer.newsletter(@users).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    

   def authorize
      if current_admin.nil?
        redirect_to login_url, alert: "Not authorized! Please log in."
      else
        #if @user && @user.admin != current_user
          #redirect_to root_path, alert: "Not authorized! Only Marty Lavin has access to these members."
        #end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :message)
    end
end
