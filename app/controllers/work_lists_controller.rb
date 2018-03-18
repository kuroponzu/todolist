require 'Kconv'

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

  def show_all
    @all_work_list = WorkList.all
  end

  # GET /work_lists/new
  def new
    @work_list = WorkList.new
  end

  # GET /work_lists/1/edit
  def edit
    @work_list = WorkList.find(params[:id])
  end

  # POST /work_lists
  # POST /work_lists.json
  def create
    @work_list = WorkList.new(work_list_params)
    if work_list_params[:file]
      Time.zone = "Tokyo"
      file_time = Time.zone.now
      file = work_list_params[:file]
      file_name = file.original_filename
      @work_list.file = file.original_filename
      result = uploadpdf(file,file_time,file_name)
    end
    if @work_list.save
      flash[:success] = "登録が完了しました。"
      redirect_to root_path
    end
  end

  # PATCH/PUT /work_lists/1
  # PATCH/PUT /work_lists/1.json
  def update
    @work_list = WorkList.find(params[:id])
    respond_to do |format|
      if @work_list.update(work_list_completed_params)
        flash[:success] = "更新が完了しました。"
      else
        flash[:danger] = "更新が失敗しました。"
      end
    redirect_to all_work_list_path
    end
  end

  # DELETE /work_lists/1
  # DELETE /work_lists/1.json
  def destroy
    @work_list = WorkList.find(params[:id])
    if @work_list.destroy
      flash[:success] = "削除が完了しました。"
    else
      flash[:danger] = "削除が失敗しました。"
    end
    redirect_to all_work_list_path
  end

  private

  def uploadpdf(file_object,file_id,file_name)
    #ext = file_name[file_name.rindex('.') + 1, 4].downcase
    #perms = ['.pdf']
    if file_object.size > 10.megabyte
      result = 'ファイルサイズは10MBまでです。'
    else
      path = "public/#{file_id}/"
      FileUtils.mkdir_p(path) unless FileTest.exist?(path)
      File.open("public/#{file_id}/#{file_name.toutf8}", 'wb') { |f| f.write(file_object.read) }
      result = "success"
    end
    return result
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_work_list
      #@work_list = WorkList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_list_params
      params.require(:work_list).permit(:work,:work_date,:worker,:file,:authorizer,:comment)
    end

    def work_list_completed_params
      params.require(:work_list).permit(:work,:work_date,:work_date_completed,
        :file,:worker,:authorizer,:comment)
    end

end
