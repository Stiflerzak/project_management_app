class ApplicationController < Sinatra::Base

    set :default_content_type, "application/json"

before do
    response.headers['Access-Control-Allow-Origin'] = "*"
end
#enable CORS preflight requests
options "*" do
    response.headers["Access-Control-Allow-Headers"] = "Content-Type"
    response.headers['Access-Control-Allow-Methods'] = "GET, POST, PUT, PATCH, DELETE, OPTIONS"
end

    get '/' do # this is the root route of the application (the homepage) but you can have as many routes as you want
        {hello: "Just a starting code 😃"}.to_json
    end

#endpoint for all category
get '/categories' do
    Category.all.to_json
end
#endpoint for agiven category sorted by id
get '/category/:id' do 
    Category.find(params[:id]).to_json
end

#endpoint for fetching all projects
get '/projects' do
    Project.all.to_json
end
#endpoint that finds a project by id
get '/project/:id' do 
    Project.find(params[:id]).to_json
end

#endpoint for adding a project
post '/project' do 
   project= Project.create(
        title: params[:title],
        description: params[:description],
        category_id: params[:category_id],
        status: false,
    )
    project.to_json
end

#project patch end point
patch '/project/:id' do 
 project= Project.find(params[:id])
 project.update(
    title: params[:title],
    description: params[:description],
    category_id: params[:category_id],
    status: params[:status],
 )
 {message: "Project has been updated"}.to_json
end

#delete from projects endpoint
delete '/project/:id' do 
   project= Project.find(params[:id])
   project.destroy
   {message: "Project was deleted succesfully('#{project.title}')"}.to_json
end

end


