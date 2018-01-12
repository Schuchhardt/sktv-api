class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	# RAILS ADMIN
	rails_admin do
		weight 8
		label "Usuario"
		label_plural "Usuarios"
	end
end
