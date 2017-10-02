module Days
  class BaseController < ApplicationController

    private

    def day
      @day ||= current_user.days.find(params[:id])
    end
  end
end
