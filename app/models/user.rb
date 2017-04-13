class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :logs, :foreign_key => 'player_one'
  has_many :opponents, :through => :logs
  has_many :inverse_logs, :class_name => 'Log', :foreign_key => 'player_two'
  has_many :inverse_opponents, :through => :inverse_logs, :source => :user
end
