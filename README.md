## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, add_index :users, :email, unique: true|
|password|string|null: false|
|name|string|null: false|

### Association
- has_many :messages
- has_many :groups, through: :groups_users
- has_many :groups_users

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|image|string||
|user_id|string|null:false, foreign_key: true|
|group_id|string|null:false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group


## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :messages
- has_many :users, through: :groups_users
- has_many :groups_users

## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group