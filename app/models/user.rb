class User < ApplicationRecord
    validates :user_id, {presence: true}
    validates :email, {presence: true, uniqueness: ture}
    validates :password, {presence: true}
end
