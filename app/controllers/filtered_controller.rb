MyApp.get '/filtered' do
	@incomplete_tasks = Tasks.incomplete(Tasks.filterByName("tasks.txt", params[:user]))
	@complete_tasks = Tasks.complete(Tasks.filterByName("tasks.txt", params[:user]))
	erb :"filtered"
end