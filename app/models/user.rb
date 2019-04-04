class User < ApplicationRecord
    validates :user_id, {presence: true}
    validates :email, {uniquness: true}
    validates :password, {presence: true}
    has_secure_password
end
