MyApp.get "/new" do
	erb :"new"
end

MyApp.get "/addTask" do
	Tasks.newTask("tasks.txt", params[:person], params[:task], rand(9999999999))
	redirect  "/"
end