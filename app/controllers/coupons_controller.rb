class CouponsController < ApplicationController
    before_action :all_coupons, only: :index
    before_action :find_coupon, only: [:show, :create]

    def index
    end

    def show
    end

    def new
        @coupon = Coupon.new
    end

    def create
        @coupon = Coupon.create(coupon_params)
        redirect_to coupon_path(@coupon)
    end

    private

    def all_coupons
        @coupons = Coupon.all
    end

    def find_coupon
        @coupon = Coupon.find_by_id(params[:id])
    end

    def coupon_params
        params.require(:coupon).permit(
            :coupon_code,
            :store
        )
    end

end
