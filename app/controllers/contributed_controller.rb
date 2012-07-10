class ContributedController < ApplicationController
  unloadable

  def find
    @id = params[:id]
    @issues = Issue.all
  end

end
