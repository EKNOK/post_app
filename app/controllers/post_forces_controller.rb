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

  def show
  end


  private

  def post_force_params

  end
end
