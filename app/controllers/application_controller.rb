# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  attr_reader :current_user
end
