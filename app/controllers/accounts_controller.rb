class AccountsController < ApplicationController
  # GET /accounts or /accounts.json
  def index
    @account = current_user.accounts.find(params[:group_id])
    @accounts = @account.ordered_accounts
    # @accounts = GroupAccount.includes(:account).where(group_id: @groups).order(created_at: :desc)
    # @total_accounts = @accounts.map { |expense| expense.account.amount }.sum
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @groups = Group.all
    @group = @groups.find(params[:group_id])
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    @group_account = GroupAccount.new(group_id: params[:group_id], account: @account)
    
    if @group_account.save
      redirect_to group_path(params[:group_id]), notice: 'Account was successfully created.'
    else
      render :new
    end
  end
  

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:name, :ammount)
  end
end
