MyApp.get '/filtered' do
	@tasks = Tasks.filterByName("tasks.txt", params[:user])
	erb :"filtered"
end