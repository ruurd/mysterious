#============================================================================
# user model
#
class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  # Make searchable
  def self.search(search)
    if search
      where('email LIKE :srch', srch: "%#{search}%")
    else
      all
    end
  end

end
