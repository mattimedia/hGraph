class TestsController < ApplicationController
  def metrics
    @submissions = Submission.find(1, :include => [:user, :contributions]) #Submission 1 is currently a default defined in seeds.rb

    respond_to do |format|
      format.html
      format.json
    end

  end

  def show
    @submission = Submission.find(params[:id], :include => [:user, :contributions])

    respond_to do |format|
      format.html
      format.json
    end
  end

  #primarily to handle created of nested Submission object
  def new
    @submission = Submission.new
    @submission.user = User.find_or_create_by_email(:email => params['submitter']['email'], :full_name => params['submitter']['full_name'])


  def create

end