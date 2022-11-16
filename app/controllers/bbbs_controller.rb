class BbbsController < ApplicationController
  before_action :set_bbb, only: %i[ show edit update destroy ]

  # GET /bbbs or /bbbs.json
  def index
    @bbbs = Bbb.all
  end

  # GET /bbbs/1 or /bbbs/1.json
  def show
  end

  # GET /bbbs/new
  def new
    @bbb = Bbb.new
  end

  # GET /bbbs/1/edit
  def edit
  end

  # POST /bbbs or /bbbs.json
  def create
    @bbb = Bbb.new(bbb_params)

    respond_to do |format|
      if @bbb.save
        format.html { redirect_to bbb_url(@bbb), notice: "Bbb was successfully created." }
        format.json { render :show, status: :created, location: @bbb }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bbb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bbbs/1 or /bbbs/1.json
  def update
    respond_to do |format|
      if @bbb.update(bbb_params)
        format.html { redirect_to bbb_url(@bbb), notice: "Bbb was successfully updated." }
        format.json { render :show, status: :ok, location: @bbb }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bbb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bbbs/1 or /bbbs/1.json
  def destroy
    @bbb.destroy

    respond_to do |format|
      format.html { redirect_to bbbs_url, notice: "Bbb was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bbb
      @bbb = Bbb.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bbb_params
      params.require(:bbb).permit(:department_id)
    end
end
