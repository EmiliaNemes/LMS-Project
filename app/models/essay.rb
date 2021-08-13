class Essay < ApplicationRecord
    has_one :assignment, as: :assignmentable
    accepts_nested_attributes_for :assignment
end
