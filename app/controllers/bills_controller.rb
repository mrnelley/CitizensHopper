class BillsController < ApplicationController
  # before_action only: [:show, :update, :destroy, :get_bill]
  # GET /bills
  # GET /bills.json
  def get_bill
    url = "https://www.govtrack.us/api/v2/bill?congress=112&order_by=-current_status_date"

    response = HTTParty.get(url)
    @reponse = response
    # @currentbill = response["objects"][0]
    # @sponsor = response["objects"][0]["sponsor"]["name"]
    # @title = response["objects"][0]["title"]
    # @kind = response["objects"][0]["bill_type"]
    # @content = response["objects"][0]["link"]
    # @bill = Bill.new(title: @title, sponsor: @sponsor, kind: @kind, content: @content)
    # @bill.save!

    @current_bills = response["objects"]
    @current_bills.each do |api_bill|
      sponsor_name = api_bill["sponsor"]["name"]
      title = api_bill["title"]
      kind = api_bill["bill_type"]
      content = api_bill["link"]
      bill = Bill.create!(title: title, sponsor: sponsor_name, kind: kind, content: content)
    end
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
    if !current_user
      redirect_to "Sign Up", new_user_registration_path
    else
      @bill = Bill.get_bill
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.fetch(:title, :kind, :sponsor, :content)
    end
end
