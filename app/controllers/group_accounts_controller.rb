class GroupAccountsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @account = @group.accounts.new
  end
end
