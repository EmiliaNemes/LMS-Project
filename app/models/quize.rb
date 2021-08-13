class Quize < ApplicationRecord
    has_one :assignment, as: :assignmentable
end
