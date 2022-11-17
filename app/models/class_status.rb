class ClassStatus < ApplicationRecord
  belongs_to :student
  belongs_to :class_list
end
