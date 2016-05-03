class Role < ActiveRecord::Base
  
has_many :users


  # has_and_belongs_to_many :users, :join_table => :users_roles
  # belongs_to :resource, :polymorphic => true
  
  # scopify

#	has_many :users

	#ROLES= %i[admin registered guest]
end
