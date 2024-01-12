##users_table


| Column                    | Type    | Options                 |
| ------------------------- | ------- | ----------------------- |
|email                      |string   | null: false unique: true|
|encrypted_password         |string   | null: false             |
|last_name                  |string   | null: false             |
|first_name                 |string   | null: false             |
|birthday                   |date     | null: false             |
|last_name_hurigana         |string   | null: false             |
|first_name_hurigana        |string   | null: false             |
|nickname                   |string   | null: false             |

###Association

has_many :items
has_many :purchases


##items_table
 
| Column                           | Type        | Options            |
| -------------------------------- | ----------- | ------------------ |
| product_name                     |string       |                    |
| product_description_id           |integer      |                    |
| category_id                      |integer      |                    |
| product_condition_id             |integer      |                    |
| shipping_burden_id               |integer      |                    |
| number_of_days_until_shipping_id |integer      |                    |
| price                            |integer      |                    |
| seller                           |string       |foreign_key: user_id|
| prefectures                      |string       |                    |

###Association

has_many :purchases_table
has_many :item_image
belongs_to :user

##purchases_table

|Column          |Type  |Options                      |
| -------------- | ---- | --------------------------- |
|user            |string|null: false foreign_key: true|
|item            |string|null: false foreign_key: true|
 
##Association

has_one :shippings_address_tables
belongs_to :user
belongs_to :item

##shippings_address_tables

|Column|Type|Options|
| -------------- | ------- | --------------- |
|post_code       |string   |null: false      |
|prefectures     |string   |null: false      |
|municipalities  |string   |null: false      |
|street_address  |string   |null: false      |
|building_name   |string   |                 |
|telephone_number|string   |null: false      |
|purchase        |reference|foreign_key: true|

##Association
belongs_to :purchase