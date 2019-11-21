class BasesController < ApplicationController
  def index
    @bases = Base.all.uniq
  end
  
  def new
    @base = Base.new
  end
  
  def create
    @base = Base.new(base_params)
    if @base.save
      flash[:success] = "拠点登録の新規作成に成功しました。"
      redirect_to bases_url
    else
      render :index
    end
  end
  
  def edit
    @base = Base.find(params[:id])
  end
  
  def update
    @base = Base.find(params[:id])
    if @base.update_attributes(base_params)
      flash[:success] = "拠点の変更をしました。"
      redirect_to bases_url
    else
      render :index
    end
  end
  
  def destroy
    @base = Base.find(params[:id])
    @base.destroy
    flash[:success] = "#{@base.base_name}のデータを削除しました。"
    redirect_to bases_url
  end
  
  private
  
    def base_params
      params.require(:base).permit(:base_id, :base_name, :attendance_typ)
    end
end
