| Column  | Type   | Options    |
| ------- | ------ | ---------- |
|nickname |string  | null: false|
|email    |string  | null: false|
|password |string  | null: false|
|name     |string  | null: false|
|birthday |string  | null: false|

belongs_to :user
 
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

has_many :messages
