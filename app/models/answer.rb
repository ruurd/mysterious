class Answer < ActiveRecord::Base
  belongs_to :question

  def self.search(search)
    if search
      where('text LIKE :srch', srch: "%#{search}%")
    else
      all
    end
  end

end
