class PosteditorsController < ApplicationController
  before_action :set_posteditor, only: %i[ show edit update destroy ]

  # GET /posteditors or /posteditors.json
  def index
    @posteditors = Posteditor.all
  end

  # GET /posteditors/1 or /posteditors/1.json
  def show
  end

  # GET /posteditors/new
  def new
    @posteditor = Posteditor.new
  end

  # GET /posteditors/1/edit
  def edit
  end

  # POST /posteditors or /posteditors.json
  def create
    @posteditor = Posteditor.new(posteditor_params)

    respond_to do |format|
      if @posteditor.save
        format.html { redirect_to @posteditor, notice: "Posteditor was successfully created." }
        format.json { render :show, status: :created, location: @posteditor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @posteditor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posteditors/1 or /posteditors/1.json
  def update
    respond_to do |format|
      if @posteditor.update(posteditor_params)
        format.html { redirect_to @posteditor, notice: "Posteditor was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @posteditor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @posteditor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posteditors/1 or /posteditors/1.json
  def destroy
    @posteditor.destroy!

    respond_to do |format|
      format.html { redirect_to posteditors_path, notice: "Posteditor was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posteditor
      @posteditor = Posteditor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def posteditor_params
      params.expect(posteditor: [ :editor_id, :user_id ])
    end
end
