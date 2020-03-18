require "net/http"
require "uri"
require "json"

class BooksController < ApplicationController
    def search
    end

    def url_from_keyword
        keyword = params.permit(:keyword)
        uri = URI.parse("https://www.googleapis.com/books/v1/volumes?q=#{keyword}&country=JP&maxResults=20")
        json = Net::HTTP.get(uri)
        @results = Json.parse(json)
    end
end