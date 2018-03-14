class PostForcesController < ApplicationController


  def index
  end

  def hoge

    # nodes取得
    posts = current_user.posts.all
    nodes = [{id: current_user.name, group: 0}]
    posts.each do |post|
      nodes.push({id: post.title, group: rand(1..6)})
    end
    # links取得
    links = []
    posts.each do |link|
      links.push({source: current_user.name, target: link.title, value: 1})
    end

    data = {nodes: nodes, links: links}

    render :json => data


  end

  def show
  end


  private

  def post_force_params

  end
end
