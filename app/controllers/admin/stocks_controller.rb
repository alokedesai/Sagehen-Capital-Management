class Admin::StocksController < Admin::AdminController

  def index
    @stocks = Stock.all.order("ticker ASC")
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new stock_params
    if @stock.valid?
      @stock.save
      redirect_to admin_stock_path(@stock)
    else
      flash[:error] = @stock.errors.full_messages.join(", ")
      redirect_to :back
    end
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    @stock.assign_attributes stock_params
    if @stock.valid?
      @stock.save
      redirect_to admin_stock_path(@stock)
    else
      flash[:error] = @stock.errors.full_messages.join(", ")
      redirect_to :back
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    redirect_to admin_stocks_path
  end

  private
  def stock_params
    params.require(:stock).permit(:ticker, :purchase_date, :share_count, :purchase_price, :share_count)
  end
end
