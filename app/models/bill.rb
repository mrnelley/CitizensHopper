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
end
