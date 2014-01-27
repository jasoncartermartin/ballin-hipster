class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.text :body
      t.boolean :private
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
