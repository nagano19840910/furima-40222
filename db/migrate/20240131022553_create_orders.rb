class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t。reference :user, foreign_key: true
      t。reference :furima, foreign_key: true

      t.timestamps
    end
  end
end
