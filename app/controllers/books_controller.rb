require 'net/http'
require 'uri'
require 'json'

class BooksController < ApplicationController
    before_action :url_from_keyword

    def results_index
        @results
    end

    def search
    end

    def url_from_keyword
        if params[:keyword] == ""
            render action: :search
        else keyword = params[:keyword]
            target = URI.encode("https://www.googleapis.com/books/v1/volumes?q=#{keyword}&country=JP")
            uri = URI.parse(target)
            json = Net::HTTP.get(uri)
            @results = Json.parse(json)
            redirect_to(books_results_index_path)
        end
    end
end