class CreatePurchases < ActiveRecord::Migration[7.0]
def change
  create_table :purchases do |t|
    
    t.references :user, null: false, foreign_key: true  # ユーザーとの関連付け
    t.references :furima, null: false, foreign_key: true  # 商品との関連付け
    t.timestamps
  end
end
end