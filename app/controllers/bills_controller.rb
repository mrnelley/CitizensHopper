class BillsController < ApplicationController
  # before_action only: [:show, :update, :destroy, :get_bill]
  # GET /bills
  # GET /bills.json

  # I know the piece de resistance of the project was this API call and getting it to save into PG!
  def get_bills
    # I know that for reasons of ease of getting this code to work, this is in the controller, but I think should really be in the model definition for bills. It's also possible to simplify your problem domain by having just one bill model with a "user_created" or "is_congressional" boolean property. See bill model for details on this potential direction.
    url = "https://www.govtrack.us/api/v2/bill?congress=112&order_by=-current_status_date"

    response = HTTParty.get(url)
    @reponse = response


    @current_bills = response["objects"]
    @current_bills.each do |api_bill|
      sponsor_name = api_bill["sponsor"]["name"]
      title = api_bill["title"]
      kind = api_bill["bill_type"]
      content = api_bill["link"]
      # you could also call .create passsing in an array of hashes, rather than from within .each-- though you'd still use .each to build the array of hashes, culling the 4 properties above from the response. i am not sure this would be more performance-optimized, however.
      bill = Bill.create!(title: title, sponsor: sponsor_name, kind: kind, content: content)
    end
    @bills = Bill.all
    render "index"
  end

  def index
    @user = current_user
    @bills = Bill.all
  end
  # GET /bills/1
  # GET /bills/1.json
  def show
    # if !current_user
    #   redirect_to "Sign Up", new_user_registration_path
    # else
    #   @bill = Bill.get_bill
    # end
    @bill = Bill.find(params[:id])
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
    # need an instance variable here @bill, form errors out
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
      params.require(:bill).permit(:title, :kind, :sponsor, :content)
    end
end
