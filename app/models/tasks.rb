class Tasks

	def Tasks.getAll(filename)
		arr = Array.new()
		
		f = File.open(filename, "r")
		f.each_line do |line|
			l = line.split("|")
		    arr.push(l[2])
		end
		f.close
		return arr
	end

end