class CreateUserCreatedBills < ActiveRecord::Migration
  def change
    create_table :user_created_bills do |t|

      t.timestamps null: false\
      t.string :title
      t.string :kind
      t.string :sponsor
      t.string :content
      t.timestamps null: false
    end
  end
end