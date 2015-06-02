#============================================================================
# Question model
#
# @startuml
# Class Question
#
# User - Question : owns >
# Question - Answer : has many >
#
# @enduml
#

class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy

  # Make searchable
  def self.search(search)
    if search
      where('description LIKE :srch', srch: "%#{search}%")
    else
      all
    end
  end

end
