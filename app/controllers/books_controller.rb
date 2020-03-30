require 'net/http'
require 'uri'
require 'json'
require 'httparty'

class BooksController < ApplicationController
    include BooksApi

    def results_index
        @results = @@results
    end

    def search
    end

    def url_from_keyword
        keyword = params[:keyword]
        results = BooksApi.get_url(keyword)
        @@results = results.parsed_response
        redirect_to(books_results_index_path)
    end
end