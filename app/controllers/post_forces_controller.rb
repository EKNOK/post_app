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
    # data = {name: current_user.name, children: []}
    # @posts = current_user.posts.all
    # @posts.each do |post|
    #   @reposts = post.reposts.all
    #   repost_d = {}
    #   @reposts.each do |repost|
    #     repost
    #   end
    #   data.push({name: post.title, children:[repost]})
    # end

    data = {"name": "flare","children": [
            {"name": "analytics","children": [
              {"name": "cluster","children": [
                {"name": "AgglomerativeCluster", "size": 3938},
                {"name": "CommunityStructure", "size": 3812},
                {"name": "HierarchicalCluster", "size": 6714},
                {"name": "MergeEdge", "size": 743}]},
              {"name": "graph","children": [
                {"name": "BetweennessCentrality", "size": 3534},
                {"name": "ShortestPaths", "size": 5914},
                {"name": "SpanningTree", "size": 3416}]},
              {"name": "optimization","children": [
                {"name": "AspectRatioBanker", "size": 7074}]}]},
            {"name": "animate","children": [
              {"name": "Easing", "size": 17010},
              {"name": "FunctionSequence", "size": 5842},
              {"name": "interpolate","children": [
                {"name": "ArrayInterpolator", "size": 1983},
                {"name": "RectangleInterpolator", "size": 2042}]},
              {"name": "ISchedulable", "size": 1041},
              {"name": "Parallel", "size": 5176},
              {"name": "TransitionEvent", "size": 1116},
              {"name": "Tween", "size": 6006}]}
            ]}

    render :json => data
  end


  private

  def post_force_params

  end
end
