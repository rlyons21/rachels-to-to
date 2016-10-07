MyApp.get "/" do
	@tasks = Tasks.getAll("tasks.txt")
	@incomplete_tasks = Tasks.incomplete("tasks.txt")
	@complete_tasks = Tasks.complete("tasks.txt")
	erb :"index"
end
