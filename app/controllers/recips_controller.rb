class RecipsController < ApplicationController
    include ActionController::MimeResponds
  skip_before_filter :verify_authenticity_token
   before_action :set_recip , only: [:show, :update, :destroy]
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers
  
  # GET /recips
  # GET /recips.json
  def index
    @recips = Recip.all

    render json: @recips.as_json
  end

  # GET /recips/1
  # GET /recips/1.json
  def show
    render json: @recip
  end

  # POST /recips
  # POST /recips.json
  def create
    #byebug
    @recip = Recip.new(recip_params)

    if @recip.save
      render json: @recip, status: :created, location: @recip
    else
      render json: @recip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recips/1
  # PATCH/PUT /recips/1.json
  def update
    @recip = Recip.find(params[:id])

    if @recip.update(recip_params)
      head :no_content
    else
      render json: @recip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recips/1
  # DELETE /recips/1.json
  def destroy
    @recip.destroy

    head :no_content
  end
      def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = 'http://192.168.1.232:3000'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*,Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      puts "-----------------------------"
      headers['Access-Control-Allow-Origin'] = 'http://192.168.1.232:3000'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'
    end
  end
  
  private

    def set_recip
      @recip = Recip.find(params[:id])
    end

    def recip_params
          params.require(:recip).permit(:name,:group,:size,:cost,:costprice,:qty,:tax,:unittype)

    end
end
