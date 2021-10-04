# frozen_string_literal: true

class SearchController < ApplicationController
  def show
    @q = Person.ransack(params[:q])
    @items = @q.result
  end
end
