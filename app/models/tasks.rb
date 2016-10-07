class Tasks

	def Tasks.getAll(filename)
		arr = Array.new()
		
		f = File.open(filename, "r")
		f.each_line do |line|
		    arr.push(line)
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


	def Tasks.newTask(filename, person, newTask, num)
		f = File.open(filename, "a+")
		f.puts("i|#{person}|#{newTask}|#{num}")
		f.close
	end



end