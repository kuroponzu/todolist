class WorkListsController < ApplicationController
  before_action :set_work_list, only: [:show, :edit, :update, :destroy]

  # GET /work_lists
  # GET /work_lists.json
  def index
    @work_lists = WorkList.all
  end

  # GET /work_lists/1
  # GET /work_lists/1.json
  def show
    @work_list = WorkList.all
  end

  # GET /work_lists/new
  def new
    @work_list = WorkList.new
  end

  # GET /work_lists/1/edit
  def edit
  end

  # POST /work_lists
  # POST /work_lists.json
  def create
    @work_list = WorkList.new(work_list_params)
    if @work_list.save
      flash[:success] = "登録が完了しました。"
      redirect_to new_slogan_path
    end

  end

  # PATCH/PUT /work_lists/1
  # PATCH/PUT /work_lists/1.json
  def update
    respond_to do |format|
      if @work_list.update(work_list_params)
        format.html { redirect_to @work_list, notice: 'Work list was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_list }
      else
        format.html { render :edit }
        format.json { render json: @work_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_lists/1
  # DELETE /work_lists/1.json
  def destroy
    @work_list.destroy
    respond_to do |format|
      format.html { redirect_to work_lists_url, notice: 'Work list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_list
      #@work_list = WorkList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_list_params
      params.require(:work_list).permit(:work,:work_date,:worker,:authorizer,:comment)
    end

end
