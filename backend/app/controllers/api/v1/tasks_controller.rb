module Api
  module V1
    class TasksController < ApplicationController
      def index
        tasks = Task.order(created_at: :desc)
        render json: { status: 'SUCCESS', data: tasks }
      end

      def create
        post = Post.new(post_params)
        if post.save
          render json: { status: 'SUCCESS', data: post }
        else
          render json: { status: 'ERROR', data: post.errors }
        end
      end

      private

      def post_params
        params.require(:post).permit(:title)
      end
    end
  end
end
