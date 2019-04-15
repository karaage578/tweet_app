class Post < ApplicationRecord
    validates :title, {presence: true}
    validates :content, {presence: true}
    enum delivery_void_flag: [:effective, :void]
end
