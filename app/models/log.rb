class Log < ActiveRecord::Base
	belongs_to :user
	belongs_to :opponent, :class_name => 'User', :foreign_key => "player_two"
	validates :player_two, :player_one_score, :player_two_score, :played_date, :presence => true
	validates :player_one_score, :player_two_score, :numericality => {:only_integer => true}, :inclusion => 0..21
end
