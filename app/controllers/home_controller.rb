MyApp.get "/" do
	
	@incomplete_tasks = Tasks.incomplete("tasks.txt")
	@complete_tasks = Tasks.complete("tasks.txt")
	erb :"index"
end
