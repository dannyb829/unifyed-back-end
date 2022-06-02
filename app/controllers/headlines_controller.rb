class HeadlinesController < ApplicationController

    def index
        render json: Headline.order(date: :desc)
    end

    def create
        headline = Headline.create!(headline_params)
        headline.create_activity(:create, owner:@current_user)
        render json: headline
    end

    def show
        headline = Headline.find(params[:id])
        render json: headline.to_json(include: [{ comments: {include: [:account, :likes], methods: [:user_liked]}}, :likes ], methods: [:user_liked])
        # render json: headline.to_json(include: [{ comments: {include: [:account, :likes, :user_liked?]}}, :likes])
    end

    def search_results
        results = Headline.where("LOWER(title) LIKE ?", "%#{params[:search]}%")
        render json: results.order(date: :desc), status: :ok
    end

    private

    def search_params
    end

    def headline_params
        params.permit(:title,:content,:author,:image_url,:date,:source,:account_id)
    end
end
