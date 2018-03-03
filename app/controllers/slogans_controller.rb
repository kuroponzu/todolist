class SlogansController < ApplicationController
  before_action :set_slogan, only: [:show, :edit, :update, :destroy]

  # GET /slogans
  # GET /slogans.json
  def index
    @slogans = Slogan.all
  end

  # GET /slogans/1
  # GET /slogans/1.json
  def random_show
    @slogan = Slogan.order("RANDOM()").first

  end

  def show_all
    @all_slogans = Slogan.all
  end

  # GET /slogans/new
  def new
    @slogan = Slogan.new
  end

  # GET /slogans/1/edit
  def edit
  end

  # POST /slogans
  # POST /slogans.json
  def create
    @slogan = Slogan.new(slogan_params)
    if @slogan.save
      flash[:success] = "登録が完了しました。"
      redirect_to root_path
    else
      flash[:danger] = "登録が失敗しました。"
      redirect_to new_slogan_path
    end
  end
#    respond_to do |format|
#      if @slogan.save
#        format.html { redirect_to @slogan, notice: 'Slogan was successfully created.' }
#        format.json { render :show, status: :created, location: @slogan }
#      else
#        format.html { render :new }
#        format.json { render json: @slogan.errors, status: :unprocessable_entity }
#      end

  # PATCH/PUT /slogans/1
  # PATCH/PUT /slogans/1.json
  def update
    respond_to do |format|
      if @slogan.update(slogan_params)
        format.html { redirect_to @slogan, notice: 'Slogan was successfully updated.' }
        format.json { render :show, status: :ok, location: @slogan }
      else
        format.html { render :edit }
        format.json { render json: @slogan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slogans/1
  # DELETE /slogans/1.json
  def destroy
    @slogan = Slogan.find(params[:id])
        if @slogan.delete
         flash[:success] = "削除しました。"
        end
        redirect_to all_slogans_path

    #@slogan.destroy
    #respond_to do |format|
    #  format.html { redirect_to slogans_url, notice: 'Slogan was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slogan
      @slogan = Slogan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slogan_params
      params.require(:slogan).permit(:content)
    end
end
