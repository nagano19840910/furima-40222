class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :post_code, null: false                  # 郵便番号
      t.string :prefecture_id, null: false                   # 都道府県
      t.string :municipalities, null: false                         # 市区町村
      t.string :street_address, null: false                      # 番地
      t.string :building_name, null: false                           # 建物名
      t.string :phone_number, null: false                 # 電話番号
      t.references :purchase, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
