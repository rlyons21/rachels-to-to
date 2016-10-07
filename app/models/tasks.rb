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


	def Tasks.complete(filename)
		arr = Array.new()

		f = File.open(filename, "r")
		f.each_line do |line|
			l = line.split("|")
			if l[0] == "c"
		    	arr.push(l[2])
			end
		end
		f.close
		return arr
	end


	def Tasks.newTask(filename, person, task, num)
		f = File.open(filename, "w")
		f.write("i|#{person}|#{task}|#{num}")
		f.close
	end



end