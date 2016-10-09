class Tasks

	# Makes each line from the "filename" file an element of an array
	#
	# filename is the name of the file that contains the information about each task
	#
	# Returns an array made up from the lines of the txt file "filename"

	def Tasks.getAll(filename)
		arr = Array.new()
		
		f = File.open(filename, "r")
		f.each_line do |line|
		    arr.push(line)
		end
		f.close
		return arr
	end

	
	# Creates an array of incomplete tasks and their information
	#
	# filename is the name of the file that contains the information about each task
	#
	# returns an array made up from the lines of the txt file "filename" of the tasks tha are incomplete

	def Tasks.incomplete(tasks)
		arr = Array.new()

		tasks.each do |task|
			t = task.split("|")
			if t[0] == "i"
		    	arr.push(t)
			end
		end
		return arr
	end


	# Creates an array of complete tasks and their information
	#
	# filename is the name of the file that contains the information about each task
	#
	# returns an array made up from the lines of the txt file "filename" of the tasks tha are complete

	def Tasks.complete(tasks)
		arr = Array.new()

		tasks.each do |task|
			t = task.split("|")
			if t[0] == "c"
		    	arr.push(t)
			end
		end
		return arr
	end


	# adds a new task and its information to the txt file
	#
	# filename is the name of the file that contains the information about each task
	# person is the string containing the name of the person the new task is assigned to
	# newTask is a string that states a task that needs to be done
	# num is a 9-digit number that is randomly generated
	#
	# returns nil

	def Tasks.newTask(filename, person, newTask, num)
		f = File.open(filename, "a+")
		f.puts("i|#{person}|#{newTask}|#{num}")
		f.close
	end


	# finds the index of a task from an array of all tasks
	#
	# filename is the name of the file that contains the information about each task
	# num is a 9-digit number that was randomly generated and assigned to a task, you can see them in "tasks.txt"
	# allTasks is an array containing each line from "filename" as an element (generated from Tasks.getAll method)
	#
	# returns an integer

	def Tasks.findTask(filename, num, allTasks)
		l = allTasks.index{|s| s.include?(num)}
		return l
	end


	# deletes a given line from the "filename" file by finding the index of "num"
	#
	# filename is the name of the file that contains the information about each task
	# num is a 9-digit number that was randomly generated and assigned to a task, you can see them in "tasks.txt"
	#
	# returns nil

	def Tasks.delete(filename, num)
		allTasks = Tasks.getAll(filename)
		line = Tasks.findTask(filename, num, allTasks)
		allTasks.delete_at(line)
		
		File.delete(filename)
		
		File.open(filename, "a") { |f|
			allTasks.each do |task|
				f.puts(task)
			end
		}
	end


	# edits a given line from the "filename" file (can change a task, who its assigned to, and completeness)
	#
	# filename is the name of the file that contains the information about each task
	# num is a 9-digit number that was randomly generated and assigned to a task, you can see them in "tasks.txt"
	# task is a string that states a task that needs to be done
	# person is a string containing the name of the person the task is assigned to
	# status is a string. Either "i" for incomplete, or "c" for complete
	#
	# returns nil

	def Tasks.edit(filename, num, task, person, status)
		allTasks = Tasks.getAll(filename)
		line = Tasks.findTask(filename, num, allTasks)
		allTasks[line] = "#{status}|#{person}|#{task}|#{num}"

		File.delete(filename)
		
		File.open(filename, "a") { |f|
			allTasks.each do |task|
				f.puts(task)
			end
		}
	end



	def Tasks.filterByName(filename, person)
		arr = Array.new()

		f = File.open(filename, "r")
		f.each_line do |line|
			l = line.split("|")
			if l[1] == person
				arr.push(line)
			end
		end
		return arr
	end
end