## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, add_index :users, :email, unique: true|
|password|string|null: false|
|name|string|null: false, foreign_key: true|

### Association
- has_many :messages
- has_many :gropus, through: :groups_users
- has_many :groups_users

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true|
|message|text|null: false|

### Association
- belongs_to :user
- belongs_to :group


## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|groupname||null: false, foreign_key: true|
|membertuika|sring|

### Association
- has_many :messages
- has_many :users, through: :groups_users
- has_many :groups_users

## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|groupus_id|integer|null: false|
|users_id|integer|null: false|

### Association
- belongs_to :user
- belongs_to :group