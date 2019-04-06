class User < ApplicationRecord
    validates :user_id, {presence: true}
    validates :email, {uniquness: true, presence: true}
end
