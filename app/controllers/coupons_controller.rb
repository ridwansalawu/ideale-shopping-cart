class CouponsController < ApiController
  before_action :set_coupon, only: [:show, :update, :destroy]

  # GET /coupons
  def index
    render json: Coupon.all.as_json, status: 200
  end

  # GET /coupons/1
  def show
    render json: @coupon
  end

  # POST /coupons
  def create
    @coupon = Coupon.new(coupon_params)

    if @coupon.save
      render json: @coupon, status: :created, location: @coupon
    else
      render json: @coupon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /coupons/1
  def update
    if @coupon.update(coupon_params)
      render json: @coupon
    else
      render json: @coupon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /coupons/1
  def destroy
    @coupon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def coupon_params
      params.require(:coupon).permit(:code, :status, :issue_date, :expiry_date)
    end
end
