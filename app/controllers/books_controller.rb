require 'net/http'
require 'uri'
require 'json'
require 'httparty'

class BooksController < ApplicationController

    def results_index
        @results = @@results
        @time = @@time
    end

    def search
    end

    def url_from_keyword
        if params[:keyword] == "" || params[:keyword] == nil
            render action: :search
        else
            keyword = params[:keyword]
            url = URI.encode("https://www.googleapis.com/books/v1/volumes?q=#{params[:keyword]}&country=JP&maxResults=15")
            response = HTTParty.get(url)
            @@results = response.parsed_response
            @@time = @@results["items"].length - 1
            redirect_to(books_results_index_path)
        end
    end
end