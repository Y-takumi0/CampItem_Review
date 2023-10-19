class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
    t.integer :category_id, null: false
    t.string :name, null: false
    t.text :introduction, null: false
    t.integer :price, null: false
    t.datetime :on_sale, null: false
    t.timestamps
    end
  end
end
