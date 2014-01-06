class PaypalExpressController < ApplicationController
  before_filter :assigns_gateway
 
  include ActiveMerchant::Billing
  include PaypalExpressHelper
 
  def checkout
    total_as_cents, setup_purchase_params = get_setup_purchase_params @cart, request
    setup_response = @gateway.setup_purchase(total_as_cents, setup_purchase_params)
    redirect_to @gateway.redirect_url_for(setup_response.token)
  end
 
  private
    def assigns_gateway
      @gateway ||= PaypalExpressGateway.new(
        :login => "seller_1229899173_biz_api1.railscasts.com",
  :password => "FXWU58S7KXFC6HBE",
  :signature => "AGjv6SW.mTiKxtkm6L9DcSUCUgePAUDQ3L-kTdszkPG8mRfjaRZDYtSu"
      )
    end
end