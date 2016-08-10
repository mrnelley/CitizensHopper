class Authorship < ActiveRecord::Base
  belongs_to :users
  belongs_to :user_created_bills
end
