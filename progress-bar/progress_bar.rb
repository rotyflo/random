class ProgressBar
	def initialize
		@progress = 0
	end

	def run
		system("clear")
		render
		@progress += 1
		sleep(0.01)
	end

	def render
		bar = Array.new(50) { " " }
		bar.map!.with_index do |unit, i|
			i <= (@progress / 2) ? "#" : unit
		end
		print bar.unshift("[").push("]").join + " #{@progress}%\n"
	end

	def complete?
		@progress == 101
	end
end

pb = ProgressBar.new

until pb.complete?
	pb.run
end

print "Download complete!\n"
