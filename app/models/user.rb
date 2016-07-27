class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :vehicles
    
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :email, presence: true, uniqueness: true, format:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, length: { maximum: 254 }
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  validates :birthdate, presence: true, :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}
#    validates :username, format: { with: /regex/ }
  before_save :is_admin
    
    private
    def is_admin
       is_admin = false
    end
end  
  
