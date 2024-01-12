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
has_many :purchase


##items_table
 
| Column                           | Type         | Options                     |
| -------------------------------- | ------------ | --------------------------- |
| product_name                     |string        |                             |
| product_description              |text          |                             |
| category_id                      |integer       |                             |
| product_condition_id             |integer       |                             |
| shipping_burden_id               |integer       |                             |
| number_of_days_until_shipping_id |integer       |                             |
| price                            |integer       |                             |
| person_exhibiting                |references    |null: false foreign_key: true|
| prefecture_id                    |integer       |null: false                  |

###Association

has_many :purchases
belongs_to :user

##purchases_table

|Column          |Type      |Options                      |
| -------------- | -------- | --------------------------- |
|user            |references|null: false foreign_key: true|
|item            |references|null: false foreign_key: true|
 
##Association

has_one :shippings_addresses_table
belongs_to :user
belongs_to :item

##shippings_addresses_table

|Column|Type|Options|
| -------------- | -------- | --------------------------- |
|post_code       |string    |null: false                  |
|prefectures_id  |integer   |null: false                  |
|municipalities  |string    |null: false                  |
|street_address  |string    |null: false                  |
|building_name   |string    |                             |
|telephone_number|string    |null: false                  |
|purchase        |references|null: false foreign_key: true|

##Association
belongs_to :purchase