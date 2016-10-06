MyApp.get "/" do
	@tasks = Tasks.getAll("tasks.txt")
	@incomplete_tasks = Tasks.incomplete("tasks.txt")
	erb :"index"
end