require 'elo.rb'

class Log < ActiveRecord::Base
	belongs_to :user, :foreign_key => 'player_one'
	belongs_to :opponent, :class_name => 'User', :foreign_key => "player_two"
	validates :player_two, :player_one_score, :player_two_score, :played_date, :presence => true
	validates :player_one_score, :player_two_score, :numericality => {:only_integer => true}, :inclusion => 0..21

	after_create :update_leader_board

	private 
	
	def update_leader_board 
      
      player1 = RatedPlayer.new(self.player_one.to_s, user_score(self.player_one))
      player2 = RatedPlayer.new(self.player_two.to_s, user_score(self.player_two))

      score = 0.0
      score = 1.0 if(self.player_one_score > self.player_two_score) 
      score = 0.5 if(self.player_one_score == self.player_two_score) 
      
      begin
        Match.new(player1, player2, score)
      rescue StandardError => e
        puts "===> Error occurs while matching #{player1.id} and #{player2.id} with score #{score}"
      end

      User.where(:id => self.player_one).first.update_attribute(:score, player1.rating)
  
    end

    def user_score user_id
      begin
        User.where(:id => user_id).pluck(:score).first
      rescue StandardError => e
        puts "===> Error occurs while looking for user score with user id #{user_id}: #{e}"
      end
    end
end
