module LogsHelper
	def result score1, score2
		if(score1 != score2)			
			return (score1 > score2) ? 'W' : 'L'
		else
			return 'D'
		end
	end
end
