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
		    	arr.push(l)
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
		    	arr.push(l)
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


	def Tasks.findTask(filename, num, allTasks)
		line = allTasks.index{|element| element.include?(num)}
		return line
	end


	def Tasks.delete(filename, num)
		allTasks = Tasks.getAll(filename)
		index = Tasks.findTask(filename, num, allTasks)
		allTasks.delete_at(index)
		
		File.delete(filename)
		
		f = File.open("tasks.txt", "a")
		allTasks.each do |task|
			f.puts(task)
		end
	end










end