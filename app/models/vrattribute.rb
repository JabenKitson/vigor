class Vrattribute < ActiveRecord::Base
  #has_many :vraas, :dependent => :destroy
  #has_many :vegresources, :through => :vraas
  has_and_belongs_to_many :vegresources
end
