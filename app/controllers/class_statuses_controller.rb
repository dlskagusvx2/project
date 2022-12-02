class ClassStatusesController < ApplicationController
  before_action :set_class_status, only: %i[ show edit update destroy ]
	
	def credit_completion
		@my_completion_class = ClassStatus.where(student_id: current_student.id, status: "수료")
		@my_applicate_class = ClassStatus.where(student_id: current_student.id, status: "신청")
		
		@completion_common_culture = @my_completion_class.where(classify: "공통교양")
		@completion_balanced_culture = @my_completion_class.where(classify: "균형교양")
		@completion_autonomous_culture = @my_completion_class.where(classify: "자율교양")
		@completion_engineering_literacy = @my_completion_class.where(classify: "공학소양")
		@completion_affiliation_culture = @my_completion_class.where(classify: "계열교양")

		@application_common_culture = @my_applicate_class.where(classify: "공통교양")
		@application_balanced_culture = @my_applicate_class.where(classify: "균형교양")
		@application_autonomous_culture = @my_applicate_class.where(classify: "자율교양")
		@application_engineering_literacy = @my_applicate_class.where(classify: "공학소양")
		@application_affiliation_culture = @my_applicate_class.where(classify: "계열교양")
	end

	def reserve_to_apply
		@my_reserve_class = ClassStatus.where(student_id: current_student.id, status: "예약")
		@my_reserve_class.each do |class_list|
			if class_list.empty?
				class_list.status = "신청"
				class_list.save
			end
		end
		redirect_to class_lists_path
	end
	
	def retake
		@my_completion_class = ClassStatus.where(student_id: current_student.id, status: "수료")
	end
  # GET /class_statuses or /class_statuses.json
  def index
    @class_statuses = ClassStatus.all
	@my_reserve_class = ClassStatus.where(student_id: current_student.id, status: "예약")
	
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
				format.html {redirect_to class_lists_path, notice: "중복신청은 되지 않습니다."}
			elsif @class_status.full?
				@class_status.status = "대기"
				@class_status.save
				format.html { redirect_to class_lists_path, notice: "강의인원이 초과되어 강의 대기 상태로 전환되었습니다." }
			elsif @class_status.time_duplicate?
				format.html {redirect_to class_lists_path, notice: "시간표가 중복되었습니다."}
			else 
				@class_status.save
				format.html { redirect_to class_lists_path, notice: "강의 신청이 완료되었습니다." }
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
      format.html { redirect_to class_lists_path, notice: "강의신청이 취소되었습니다." }
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
