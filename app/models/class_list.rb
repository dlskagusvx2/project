class ClassList < ApplicationRecord
  belongs_to :department
  belongs_to :professor
end
