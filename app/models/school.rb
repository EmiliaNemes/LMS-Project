 class School < ApplicationRecord

    has_many :users, inverse_of: :school, dependent: :destroy 
end