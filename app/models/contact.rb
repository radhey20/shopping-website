class Contact < ActiveRecord::Base
attr_accessible :comment, :email, :name
validates_presence_of :email
validates_presence_of :name
validates_presence_of :comment



end
