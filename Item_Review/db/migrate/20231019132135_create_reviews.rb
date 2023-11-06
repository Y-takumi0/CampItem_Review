class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
    t.references :user, foreign_key: true
    t.references :item, foreign_key: true
    t.text :article
    t.integer :score
    t.boolean :display_status, null: false, default: true
    t.timestamps
    end
  end
end
