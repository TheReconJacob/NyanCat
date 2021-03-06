require "sinatra"
require "sinatra/activerecord"
require_relative "./models/blog.rb"
require 'pry'

class Server < Sinatra::Base
    get /\/|\/posts/ do
        erb :index, locals: {posts: Post.all}
    end
    get "/posts/:id/delete" do |id|
        Post.delete(id)
        erb :index, locals: {posts: Post.all}
    end
    post "/posts" do
        body = params["body"]
        title = params["title"]
        image = params["image"]
        date = Time.now.to_s
        Post.create(body: body, title: title, image: image, date: date)
        erb :index, locals: {posts: Post.all}
    end
    post "/posts/:post_id/comments" do |post_id|
        comment = params["comment"]
        Comment.create(content: comment, post_id: post_id)
        erb :index, locals: {posts: Post.all}
    end
    get "/posts/:post_id/comments" do |post_id|
        erb :index, locals: {posts: Post.all}
    end
end