MyApp.get '/' do
	@incomplete_tasks = Tasks.incomplete(Tasks.getAll("tasks.txt"))
	@complete_tasks = Tasks.complete(Tasks.getAll("tasks.txt"))
	erb :"index"
end

MyApp.get '/delete' do
	Tasks.delete("tasks.txt", params[:num])
	redirect '/'
end

MyApp.get '/edit' do
	erb :"edit"
end

MyApp.get '/editTask' do 
	Tasks.edit("tasks.txt", params[:num], params[:task], params[:person], params[:status])
	redirect '/'
end
