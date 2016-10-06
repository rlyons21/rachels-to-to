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

	#def Tasks.delete(filename)


	def Tasks.incomplete(filename)
		arr = Array.new()

		f = File.open(filename, "r")
		f.each_line do |line|
			l = line.split("|")
			if l[0] == "i"
		    	arr.push(l[2])
			end
		end
		f.close
		return arr
	end

end