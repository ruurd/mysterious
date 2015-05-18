class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  def self.search(search)
    if search
      where('email LIKE :srch', srch: "%#{search}%")
    else
      all
    end
  end

end
