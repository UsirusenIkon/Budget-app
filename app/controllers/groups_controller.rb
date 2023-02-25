class GroupsController < ApplicationController
  before_action :authenticate_user!
  # GET /groups or /groups.json
  def index
    @groups = Group.where(user: current_user)
    @accounts = Account.where(user: current_user).order(created_at: :desc)
    @group_accounts = GroupAccount.all
    @categories = Group.includes(:accounts)
    @group_totals = {}

    @categories.each do |group|
      total_price = 0
      group.accounts.each do |account|
        total_price += account.ammount
      end
      @group_totals[group.id] = total_price
    end
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.find(params[:id])
    @accounts = @group.accounts.where(user: current_user).order(created_at: :desc)
    @categories = Group.includes(:accounts)
    @group_totals = {}

    @categories.each do |group|
      total_price = 0
      group.accounts.each do |account|
        total_price += account.ammount
      end
      @group_totals[group.id] = total_price
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
    @groups = Group.all
    @account = Account.new
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to groups_path, notice: 'Group created successfully'
    else
      render :new, alert: 'Sorry an error occured. Please try again'
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = current_user.groups.all
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
