MyApp.get "/" do
	@tasks = Tasks.getAll("tasks.txt")
	erb :"index"
end