class UsersController < ApplicationController
  def index
    @hello = 'Hello, world!!!!'

    render template: 'users/index'
  end
end
