class ApplicationController < Sinatra::Base

    set :default_content_type, "application/json"



    get '/' do # this is the root route of the application (the homepage) but you can have as many routes as you want
        {hello: "Just a starting code 😃"}.to_json
    end


get '/categories' do
    Category.all.to_json
end

get '/category/:id' do 
    Category.find(params[:id]).to_json
end

end


