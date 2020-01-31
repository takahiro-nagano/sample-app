class UsersController < ApplicationController
  
  
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end 
  
  def edit
    @user = User.find(params[:id])
  end
 
  def index
    @users = User.paginate(page: params[:page])
  end
    
  def edit_basic
    @user = User.find(params[:id])
  end
    
  def update_basic
      @user = User.find(params[:id])
   if @user.update_attributes(basic_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
   else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
   end
      redirect_to users_url
  end
    
    
  def update
     @user = User.find(params[:id])
   if @user.update_attributes(user_params)
     redirect_to user_path
   else
     render 'edit'
   end
  end
  
    
    
    
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
  end
    
  def basic_params
    params.require(:user).permit(:basic_time, :work_time)
  end  
    
    
end
