# frozen_string_literal: true

# class creates advisor model
class Advisor < ActiveRecord::Base
  has_secure_password
  has_many :students
  has_many :petitions, through: :students

  def recent_petitions
    Petition.all.limit(4)
  end
end
