class RssUrlsController < ApplicationController
  # GET /rss_urls
  # GET /rss_urls.json
  def index
    @rss_urls = RssUrl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rss_urls }
    end
  end

  # GET /rss_urls/1
  # GET /rss_urls/1.json
  def show
    @rss_url = RssUrl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rss_url }
    end
  end

  # GET /rss_urls/new
  # GET /rss_urls/new.json
  def new
    @rss_url = RssUrl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rss_url }
    end
  end

  # GET /rss_urls/1/edit
  def edit
    @rss_url = RssUrl.find(params[:id])
  end

  # POST /rss_urls
  # POST /rss_urls.json
  def create
    @rss_url = RssUrl.new(params[:rss_url])

    respond_to do |format|
      if @rss_url.save
        format.html { redirect_to @rss_url, notice: 'Rss url was successfully created.' }
        format.json { render json: @rss_url, status: :created, location: @rss_url }
      else
        format.html { render action: "new" }
        format.json { render json: @rss_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rss_urls/1
  # PUT /rss_urls/1.json
  def update
    @rss_url = RssUrl.find(params[:id])

    respond_to do |format|
      if @rss_url.update_attributes(params[:rss_url])
        format.html { redirect_to @rss_url, notice: 'Rss url was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rss_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rss_urls/1
  # DELETE /rss_urls/1.json
  def destroy
    @rss_url = RssUrl.find(params[:id])
    @rss_url.destroy

    respond_to do |format|
      format.html { redirect_to rss_urls_url }
      format.json { head :no_content }
    end
  end
end
