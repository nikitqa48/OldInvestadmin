class UsersController < ApplicationController
  before_action :permit_params, only: [:index, :edit, :create, :update]
  load_and_authorize_resource

  def index
    @users = User.all
    @users = @users.paginate page: @page, per_page: 20
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @roles = User.roles_list
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def create
    @user = User.new params[:user]
    @user.save ? redirect_to(action: :index) : render(:new)
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(params[:user])
      flash[:notice] = t 'messages.record_updated'
      redirect_to users_path
    else
      render action: :edit
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to action: :index
  end

  def participate
    params.permit :email, :organization
    @user = User.find_by_email params[:email]
    unless @user
      company = Company.create :name => params[:organization]
      User.invite! :email => params[:email], :role => :manager, :company_id => company.id
      @user = User.find_by_email params[:email]
      render :text => url_for(:controller => "devise/invitations", :action => "edit", :invitation_token => @user.invitation_token)
    else
      render :text => new_project_url
    end
  end

  private


  def permit_params
    if params[:user].present?
      params[:user].delete(:password) if params[:user][:password].blank?
      params[:user].delete('role') unless current_user.role?(:admin)
      params[:user] = params.require(:user).permit(:email, :password, :role, :name, :phone)
    end
  end
end