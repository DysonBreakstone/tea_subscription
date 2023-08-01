class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :title
      t.boolean :status, default: true
      t.integer :frequency

      t.timestamps
    end
  end
end
