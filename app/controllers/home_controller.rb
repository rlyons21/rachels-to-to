MyApp.get '/' do
	@incomplete_tasks = Tasks.incomplete("tasks.txt")
	@complete_tasks = Tasks.complete("tasks.txt")
	erb :"index"
end

MyApp.get '/delete' do
	Tasks.delete("tasks.txt", params[:num])
	redirect '/'
end

MyApp.get '/edit' do
	erb :"edit"
end
