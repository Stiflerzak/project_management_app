class ApplicationController < Sinatra::Base

    set :default_content_type, "application/json"



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



end


