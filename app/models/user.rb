class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  # 各モデルとのアソシエーション

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'には漢字・ひらがな・カタカナを使用して下さい' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'には漢字・ひらがな・カタカナを使用して下さい' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'にはカタカナを使用して下さい' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'にはカタカナを使用して下さい' }
    validates :birthday
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'には半角英数字を使用して下さい' }
  validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'には半角英数字を使用してください' }
end
