class PostForcesController < ApplicationController


  def index
  end

  def hoge
    # nodes取得
    # postsの取得
    posts = current_user.posts.all
    # current_userの取得と、最初のnodeに挿入
    nodes = [{id: current_user.name, group: 0}]
    # userが作成したpostをnodeに挿入
    posts.each do |post|
      nodes.push({id: post.title, group: rand(1..6)})
    end
    # links取得
    links = []
    posts.each do |link|
      links.push({source: current_user.name, target: link.title, value: 1})
    end
    # dataにnodeとlinksを代入
    data = {nodes: nodes, links: links}
    render :json => data


  end

  def test

  end

  def link
    d_comment = []
    d_repost = []
    d_post = []

    @posts = current_user.posts.all
    @posts.each do |post|
      d_repost = []
      d_post = []
      @reposts = post.reposts.all
      @reposts.each do |repost|
        d_comment = []
        @comments = repost.comments.all
        @comments.each do |comment|
          d_comment.push({name: comment.content, size: 3000})
        end
        d_repost.push(name: repost.content, size: 3000, children: d_comment)
      end
      d_post.push(name: post.title, size: 5000, children: d_repost)
    end
    data = {name: current_user.name,size: 7000, children: d_post}
    render :json => data

  end


  private

  def post_force_params

  end
end
