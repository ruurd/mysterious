class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy

  def self.search(search)
    if search
      where('description LIKE :srch', srch: "%#{search}%")
    else
      all
    end
  end

end
