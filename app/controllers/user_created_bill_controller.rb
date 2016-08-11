class UserCreatedBillsController < ApplicationController
  before_action :set_user_created_bill, only: [:show, :edit, :update, :destroy, :new]

  def index
    @user_created_bills = UserCreatedBill.all
  end
  def edit
  end
  def show
    redirect_to user_created_bills_path
  end
  def new
    @user_created_bill = UserCreatedBill.new
  end
  def create
    @user_created_bill = Bill.new(user_created_bill_params)

    respond_to do |format|
      if @user_created_bill.save
        format.html { redirect_to @user_created_bill, notice: 'Bill was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  def update
    respond_to do |format|
      if @user_created_bill.update(user_created_bill_params)
        format.html { redirect_to @user_created_bill, notice: 'Bill was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  def destroy
    @user_created_bill.destroy
    respond_to do |format|
      format.html { redirect_to user_created_bills_url, notice: 'Bill was successfully destroyed.' }
    end
  end
  private
  def set_user_created_bill
    @user_created_bill = UserCreatedBill.all
  end

  def bill_params
      params.require(:user_created_bill).permit(:title, :kind, :content, :sponsor)
  end
end
