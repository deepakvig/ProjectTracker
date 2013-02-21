class CommentsController < ApplicationController
  load_and_authorize_resource

  before_filter :find_feature

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @feature.comments.build(:description => params[:new_comment])
    @comment.user = current_user
    emails = @feature.project.find_all_users - [current_user.email]

    respond_to do |format|
      if @comment.save
        UserMailer.new_comment(emails, current_user.email, @feature.project.title).deliver
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json 
        format.js 
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js 
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
  def find_feature
    puts params
    @feature = Feature.find(params[:feature_id])
  end
end
