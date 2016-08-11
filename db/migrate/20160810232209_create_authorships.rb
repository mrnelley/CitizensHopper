class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
      t.integer :user_id
      t.integer :usercreatedbill_id
      t.timestamps null: false
    end
  end
end
