class CuesController < ApplicationController
  # GET /cues
  # GET /cues.json
  def index
    @cues = Cue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cues }
    end
  end

  # GET /cues/1
  # GET /cues/1.json
  def show
    @cue = Cue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cue }
    end
  end

  # GET /cues/new
  # GET /cues/new.json
  def new
    @cue = Cue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cue }
    end
  end

  # GET /cues/1/edit
  def edit
    @cue = Cue.find(params[:id])
  end

  # POST /cues
  # POST /cues.json
  def create
    @cue = Cue.new(params[:cue])

    respond_to do |format|
      if @cue.save
        format.html { redirect_to @cue, notice: 'Cue was successfully created.' }
        format.json { render json: @cue, status: :created, location: @cue }
      else
        format.html { render action: "new" }
        format.json { render json: @cue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cues/1
  # PUT /cues/1.json
  def update
    @cue = Cue.find(params[:id])

    respond_to do |format|
      if @cue.update_attributes(params[:cue])
        format.html { redirect_to @cue, notice: 'Cue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cues/1
  # DELETE /cues/1.json
  def destroy
    @cue = Cue.find(params[:id])
    @cue.destroy

    respond_to do |format|
      format.html { redirect_to cues_url }
      format.json { head :no_content }
    end
  end
end
