class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name, null: false
      t.text :body, null: false

      t.timestamps
    end
    
    add_index :comments, :name, unique: true
  end
end
