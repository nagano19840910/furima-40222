##user_table


| Column  | Type   | Options    |
| ------- | ------ | ---------- |
|nickname |string  | null: false|
|email    |string  | null: false|
|password |string  | null: false|
|name     |string  | null: false|
|birthday |string  | null: false|

###Association

belongs_to :user

##items_table
 
| Column                        | Type        | Options    |
| ----------------------------- | ----------- | ---------- |
| product image                 |references   |            |
| product name                  |string       |            |
| product description           |text         |            |
| category                      |references   |            |
| product condition             |references   |            |
| shipping burden               |references   |            |
| region of origin              |references   |            |
| number of days until shipping |references   |            |
| price                         |string       |            |
| seller                        |string       |            |


###Association

has_many :messages

##purchase_table

|Column          |Type  |Options    |
| -------------- | ---- | --------- |
|card information|number|null: false|
|date of expiry  |number|null: false|
|security code   |number|null: false|

##Association

has_one :profile

##shipping_address_table

|Column|Type|Options|
| -------------- | ---- | --------- |
|post code       |number|null: false|
|prefectures     |string|null: false|
|municipalities  |string|null: false|
|street address  |number|null: false|
|building name   |string|null: false|
|telephone number|number|null: false|

##Association

belongs_to :user