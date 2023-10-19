class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
    t.integer :user_id, null: false
    t.integer :item_id, null: false
    t.text :article, null: false
    t.boolean :disp_status, null: false, default: true
    t.timestamps
    end
  end
end
