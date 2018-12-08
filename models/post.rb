class Post

  attr_accessor :id, :title, :body

  def self.open_connection
    conn = PG.connect(dbname: "blog", user: "postgres", password: "Acad3my1")
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM post ORDER BY id"
    results = conn.exec(sql)

    #making an instance of post class
    # an array of objects posts
    #hydrate seperates the column and map builds the array of objects
    posts = results.map do |tuple|
      self.hydrate tuple
    end

    return posts
  end

  def self.find id
    conn = self.open_connection
    sql = "SELECT * FROM post WHERE id = #{id}"
    result = conn.exec(sql)

    post = self.hydrate result[0]

    return post
  end

  def self.hydrate post_data
    post = Post.new

    post.id = post_data['id']
    post.title = post_data['title']
    post.body = post_data['body']

    return post
  end

  def save
    conn = Post.open_connection
    if (!self.id)
    sql = "INSERT INTO post (title, body) VALUES ('#{self.title}', '#{self.body}')"
    else
      sql = "UPDATE post SET title = '#{self.title}', body = '#{self.body}' WHERE id = '#{self.id}'"
    end
    conn.exec(sql)
  end

  def self.destroy id
    conn = Post.open_connection
    sql = "DELETE FROM post WHERE id = '#{id}'"
    conn.exec(sql)
  end
end
