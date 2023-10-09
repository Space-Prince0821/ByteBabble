class BabblesController < ApplicationController
  before_action :set_babble, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /babbles or /babbles.json
  def index
    @babbles = Babble.all.order("created_at DESC")
    @babble = Babble.new
  end

  # GET /babbles/1 or /babbles/1.json
  def show
  end

  # GET /babbles/new
  def new
    @babble = current_user.babbles.build
  end

  # GET /babbles/1/edit
  def edit
  end

  # POST /babbles or /babbles.json
  def create
    @babble = current_user.babbles.build(babble_params)

    respond_to do |format|
      if @babble.save
        format.html { redirect_to root_path, notice: "Babble was successfully created." }
        format.json { render :show, status: :created, location: @babble }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @babble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /babbles/1 or /babbles/1.json
  def update
    respond_to do |format|
      if @babble.update(babble_params)
        format.html { redirect_to babble_url(@babble), notice: "Babble was successfully updated." }
        format.json { render :show, status: :ok, location: @babble }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @babble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /babbles/1 or /babbles/1.json
  def destroy
    @babble.destroy

    respond_to do |format|
      format.html { redirect_to babbles_url, notice: "Babble was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_babble
      @babble = Babble.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def babble_params
      params.require(:babble).permit(:babble, attachments: [])
    end
end
