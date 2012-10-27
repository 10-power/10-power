class Admin::UsersController < Admin::ApplicationController
  before_filter :require_admin
  before_filter :load_user

  def index
    @users = User.all
  end

  def new
  end

  def edit
  end

  def update
    is_admin = params[:user] && params[:user].delete(:is_admin)

    @user.attributes = params[:user]
    @user.is_admin = is_admin if current_user.is_admin?

    if @user.save
      redirect_to admin_users_path, :notice => 'Changes Saved'
    else
      render :edit
    end
  end
  alias :create :update

  private

  def load_user
    @user = params[:id] ? User.find_by_id(params[:id]) : User.new
  end

  def require_admin
    redirect_to admin_root_path unless @current_user.is_admin?
  end
end
