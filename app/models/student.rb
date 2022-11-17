class Student < ApplicationRecord
	belongs_to :department
	has_many :class_lists, :through => :class_statuses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	
end
