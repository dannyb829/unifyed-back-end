class HeadlinesController < ApplicationController

    def index
        render json: Headline.all
    end

    def create
        headline = Headline.create!(headline_params)
        render json: headline
    end

    def show
        headline = Headline.find(params[:id])
        render json: headline.to_json(include: [{ comments: {include: [:account, :likes]}}, :likes])
    end

    private

    def headline_params
        params.permit(:title,:content,:author,:image_url,:date,:source)
    end
end
