# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| image           | string  | null: false |
| name            | string  | null: false |
| description     | text    | null: false |
| category        | string  | null: false |
| condition       | string  | null: false |
| delivery_charge | integer | null: false |
| prefecture      | string  | null: false |
| shipping_days   | string  | null: false |
| price           | integer | null: false |

### Association
- belongs_to :users
- has_one :purchases

##  purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- has_one :address
- has_one :items
- belongs_to :users

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| credit_code   | string     |                                |
| period        | string     | null: false, foreign_key: true |
| sq_code       | string     | null: false, foreign_key: true |
| post_code     | string     | null: false, foreign_key: true |
| prefecture    | string     | null: false, foreign_key: true |
| city          | string     | null: false, foreign_key: true |
| house_number  | string     | null: false, foreign_key: true |
| building_name | string     | null: false, foreign_key: true |
| phone_number  | integer    | null: false, foreign_key: true |

### Association
- has_one :purchases