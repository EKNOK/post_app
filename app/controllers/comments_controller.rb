class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :comment_connect_user, only:[:destroy]


  def create
    @comment = current_user.comments.build(comment_params)
    repost = Repost.find(params[:comment][:repost_id])
    if @comment.save
      redirect_to post_path(repost.post_id)
    else
      flash[:danger] = "Comment Missing !"
      redirect_back(fallback_location: post_path(repost.post_id))
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "comment destory !"
    redirect_back(fallback_location: post_path)
  end

  def index
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

  def comment_params
    params.require(:comment).permit(:content, :repost_id)
  end

  def comment_connect_user
    @comment = current_user.comments.find_by(id: params[:id])
    if @comment.nil?
      flash[:danger] = "Have no autherity to This Comment ! try again !"
      redirect_back(fallback_location: post_path)
    end
  end

end
