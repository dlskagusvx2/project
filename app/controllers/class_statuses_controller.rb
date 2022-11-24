class ClassStatusesController < ApplicationController
  before_action :set_class_status, only: %i[ show edit update destroy ]

  # GET /class_statuses or /class_statuses.json
  def index
    @class_statuses = ClassStatus.all
  end

  # GET /class_statuses/1 or /class_statuses/1.json
  def show
  end

  # GET /class_statuses/new
  def new
    @class_status = ClassStatus.new
  end

  # GET /class_statuses/1/edit
  def edit
  end

  # POST /class_statuses or /class_statuses.json
  def create
    @class_status = ClassStatus.new(class_status_params)

		respond_to do |format|
			if @class_status.overlap?
				format.html {redirect_to root_path, notice: "중복신청은 되지 않습니다."}
			elsif @class_status.full?
				@class_status.status = "대기"
				@class_status.save
				format.html { redirect_to root_path, notice: "강의인원이 초과되어 강의 대기 상태로 전환되었습니다." }
			else @class_status.save
				format.html { redirect_to root_path, notice: "강의 신청이 완료되었습니다." }
			end
		end
  end

  # PATCH/PUT /class_statuses/1 or /class_statuses/1.json
  def update
    respond_to do |format|
      if @class_status.update(class_status_params)
        format.html { redirect_to class_status_url(@class_status), notice: "Class status was successfully updated." }
        format.json { render :show, status: :ok, location: @class_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_statuses/1 or /class_statuses/1.json
  def destroy
    @class_status.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "강의신청이 취소되었습니다." }
      format.json { head :no_content }
    end
	  ClassStatus.all.each do |class_status|
		  @waiting_class_list = ClassStatus.where(class_list_id: class_status.class_list_id, status: "대기")
		  if class_status.empty?
			  @waiting_class_list.each do |class_list| 
					if class_list.full?
						break
					end

					@waiting = class_list
					@waiting.status = "신청"
					@waiting.save
				end
		  end
	  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_status
      @class_status = ClassStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_status_params
      params.require(:class_status).permit(:status, :score, :student_id, :class_list_id)
    end
end
