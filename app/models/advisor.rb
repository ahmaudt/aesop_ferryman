
# class creates advisor model
class Advisor < ActiveRecord::Base
  has_secure_password
  has_many :students
  has_many :petitions, through: :students
end
