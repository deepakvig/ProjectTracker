class FeaturesController < ApplicationController
  load_and_authorize_resource :project, except: [:mark_accepted]
  load_and_authorize_resource through: :project, except: [:mark_accepted]

  # GET /features
  # GET /features.json
  def index
    @features = Feature.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @features }
    end
  end

  # GET /features/1
  # GET /features/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feature }
    end
  end

  # GET /features/new
  # GET /features/new.json
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feature }
    end
  end

  # GET /features/1/edit
  def edit
  end

  # POST /features
  # POST /features.json
  def create
    @feature.user = current_user

    respond_to do |format|
      if @feature.save
        format.html { redirect_to [@project, @feature], notice: 'Feature was successfully created.' }
        format.json { render json: @feature, status: :created, location: @feature }
      else
        format.html { render action: "new" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /features/1
  # PUT /features/1.json
  def update

    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.html { redirect_to [@project, @feature], notice: 'Feature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /features/1
  # DELETE /features/1.json
  def destroy
    @feature.destroy

    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :no_content }
    end
  end

  def mark_accepted
    @feature = Feature.find(params[:id])
    if current_user.role?(:admin) || current_user.tracking_projects.include?(@feature.project)
      @feature.accepted = "yes"
      @feature.save
    else
      render text: 'not good'
    end
  end
end
