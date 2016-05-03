
class User < ActiveRecord::Base
attr_accessor :current_password

has_many :articles
has_many :comments
has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/default.jpeg"
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



 after_create :task 

  def task
  	self.add_role :registered
  end
end
