class UsercreatedbillsController < ApplicationController
  # before_action :set_usercreatedbill, only: [:show, :edit, :update, :destroy, :new]
  before_action :authenticate_user!
  @usercreatedbills = Usercreatedbill.all  
  def index
    @usercreatedbills = Usercreatedbill.all
  end

  def edit
      @usercreatedbill = Usercreatedbill.find(params[:id])
  end

  def show
    @usercreatedbill = Usercreatedbill.find(params[:id])
  end

  def new
    @usercreatedbill = Usercreatedbill.new
  end

  def create
    @usercreatedbill = Usercreatedbill.new(usercreatedbill_params)

    respond_to do |format|
      if @usercreatedbill.save
        format.html { redirect_to @usercreatedbill, notice: 'Bill was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @usercreatedbill = Usercreatedbill.find(params[:id])
    respond_to do |format|
      if @usercreatedbill.update(usercreatedbill_params)
        format.html { redirect_to @usercreatedbill, notice: 'Bill was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  def destroy
    @usercreatedbill = Usercreatedbill.find(params[:id])
    @usercreatedbill.destroy
    respond_to do |format|
      format.html { redirect_to usercreatedbills_url, notice: 'Bill was successfully destroyed.' }
    end
  end
  private
  # def set_usercreatedbill
  #   @usercreatedbill = UserCreatedBill.all
  # end

  def usercreatedbill_params
      params.require(:usercreatedbill).permit(:title, :kind, :content, :sponsor)
  end
end
