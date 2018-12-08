# require "sinatra"
# #so no need to cancel the process
# require "sinatra/contrib"
# #so no need to reload sinatra
# require "sinatra/reloader" if development?

# #when getting root request then only show h1
# #static route
# get "/" do
#   "<h1>Hello Sinatra with reloader!</h1>"
# end
#
# #will never change- its a static route
# get '/new' do
#   "<h1>Hello new page!</h1>"
# end
#
# #GET always from borwser to get something
# #POST DELETE PATCH AND PUT always change something
#
# #methods that are first will apply first
# #methods put after and declared before will not override
#
# #dynamic route
# # get "/:id" do
# #   #the variable is getting the parameters (call it param in ruby)
# #   #passing everything from /:id into [:id] and assigning it to id
# #   id = params[:id]
# #   "<h1>Showing the page number #{id}</h1>"
# # end
#
# #dynamic route
# # get "/:id" do
# #   id = params[:id]
# #   "<h1>Hi #{id}</h1>"
# # end
#
# get "/:id" do
#   id = params[:id]
#   if id =="taco"
#     "<h1>Hi #{id}</h1>"
#   elsif id == "burito"
#     "<h1>Hi #{id}</h1>"
#   else
#     "<h1>BYE</h1>"
#   end
# end
