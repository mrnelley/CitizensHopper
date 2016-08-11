class CreateUsercreatedbills < ActiveRecord::Migration
  def change
    create_table :usercreatedbills do |t|
      t.string :title
      t.string :kind
      t.string :sponsor
      t.string :content
      t.timestamps null: false
    end
  end
end
