##users_table


| Column            | Type    | Options                 |
| ----------------- | ------- | ----------------------- |
|email              |string   | null: false unique: true|
|encrypted_password |string   | null: false             |
|sex                |string   | null: false             |
|given_name         |string   | null: false             |
|birthday           |date     | null: false             |
|sexual_kana        |string   | null: false             |
|name_kana          |string   | null: false             |

###Association

belongs_to :items

##items_table
 
| Column                        | Type        | Options    |
| ----------------------------- | ----------- | ---------- |
| product_image                 |references   |            |
| product_name                  |string       |            |
| product_description           |text         |            |
| category                      |references   |            |
| product_condition             |references   |            |
| shipping_burden               |references   |            |
| number_of_days_until_shipping |references   |            |
| price                         |string       |            |
| seller                        |string       |            |
| prefectures                   |string       |            |

###Association

has_many :purchases_table

##purchases_table

|Column          |Type  |Options    |
| -------------- | ---- | --------- |
|user            |string|null: false|
|merchandise     |string|null: false|
 
##Association

has_one :shippings_address_table

##shippings_address_table

|Column|Type|Options|
| -------------- | ---- | --------- |
|post_code       |string|null: false|
|prefectures     |string|null: false|
|municipalities  |string|null: false|
|street_address  |string|null: false|
|building_name   |string|           |
|telephone_number|string|null: false|
