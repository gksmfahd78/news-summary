class News < ApplicationRecord
    validates_uniqueness_of :title
end