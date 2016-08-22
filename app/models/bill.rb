class Bill < ActiveRecord::Base

  # attr_reader :title, :kind, :sponsor, :content

  # def get_bill
  #   url = "https://www.govtrack.us/api/v2/bill?congress=112&order_by=-current_status_date"
  #
  #   return response = HTTParty.get(url)
  #   @bill = response ["objects"][0]
  #   @sponsor = @bill["sponsor"]["name"]
  #   @title = @bill["title"]
  #   @kind = @bill["bill_type"]
  #   @content = @bill["link"]
  # end

  # I think it would make sense to simplify your problem domain by cutting down to 1 bill model. Also, I'd recommend adding a property to bill to determine whether or not it orginated from a user or from an API call.

  #The main reason I might argue that you should cut down to one bill model, is that it would simplify your join table "authorships" if you want to have both types of bills. Alternatively, you could keep both models and create a "Following" join for a Congressional bill.
end
