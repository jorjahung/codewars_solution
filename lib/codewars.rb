# Codewars style ranking system
class User
	RANKS = [-8,-7,-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8]
	START_PROGRESS = 0

	attr_accessor :rank, :progress
	
	def initialize
		@rank = RANKS.first
		@progress = START_PROGRESS
	end

	def upgrade

		if @progress >= 100
			loop do
				@progress -= 100
				r = RANKS.index(@rank)
				@rank = RANKS[r+1]
			break if @progress < 100
			end
		end

		if rank == RANKS.last
      @progress = 0
    end
	end	

 	def inc_progress(n)

 		raise "ERROR" if !RANKS.include? n
 			
 		if n == rank
   			@progress+= 3
 		elsif n < rank
      if n < (rank- 2)
 			  @progress+= 0
      else
 			  @progress+= 1
      end 
 		elsif n > 0 && rank < 0
 			d = (n-1) - rank
 			@progress+= 10*d*d 		
 		else
 			d = n - rank
 			@progress+= 10*d*d
 		end
 		upgrade
	end
end