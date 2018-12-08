class PostController<Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), "..")

  set :view, Proc.new { File.join(root, "views") }

configure:development do
  register Sinatra::Reloader
end

# $posts = [
#   {
#     id: 0,
#     title: "Post 1",
#     body: "This is the body of post 1"
#   },
#   {
#     id: 1,
#     title: "Post 2",
#     body: "This is the body of post 2"
#   },
#   {
#     id: 2,
#     title: "Post 3",
#     body: "This is the body of post 3"
#   }
# ]

  get "/" do
    # "<h1>Hello Sinatra with reloader!</h1>"
    @title_for_the_page = "Blog Posts"
    #getting the whole array of hashes
    #instance varaible from controller to class
    @posts = Post.all
    erb :"posts/index"
  end

  #will never change- its a static route
  get '/new' do
    # @post  = {
    #   id: "",
    #   title: "",
    #   body: ""
    # }

    @post = Post.new
    erb :"posts/new"
  end

  get "/:id_from_url" do
    id = params[:id_from_url].to_i
    @post = Post.find id
    erb :"posts/show"
  end

  get '/:id/edit' do
    id = params[:id].to_i
    @post = Post.find id
    erb :"posts/edit"
  end

  put '/:id' do
    id = params[:id].to_i
    # post = $posts[id]
    # post[:title] = params[:title]
    # post[:body] = params[:body]

    post = Post.find id
    post.title = params[:title]
    post.body = params[:body]
    post.save
    redirect '/'
  end

  delete '/:id' do
    id = params[:id].to_i
    Post.destroy id
    redirect '/'
  end

  post '/' do
    # new_post = {
    #   id: $posts.length,
    #   title: params[:title],
    #   body: params[:body]
    # }
    # $posts.push new_post

    post = Post.new
    post.title = params[:title]
    post.body = params[:body]
    post.save

    redirect "/"
  end

end
