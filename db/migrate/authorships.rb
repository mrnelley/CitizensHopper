class Authorships < ActiveRecord::Migration
  def change
    create_table :Authorships do |t|

      t.timestamps null: false\
      t.integer :user_id
      t.integer :user_created_bill_id
      t.timestamps null: false
    end
  end
end
