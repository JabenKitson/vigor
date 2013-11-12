class ReviewCatsController < ApplicationController
  # GET /review_cats
  # GET /review_cats.xml
  def index
    @review_cats = ReviewCat.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @review_cats }
    end
  end

  # GET /review_cats/1
  # GET /review_cats/1.xml
  def show
    @review_cat = ReviewCat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @review_cat }
    end
  end

  # GET /review_cats/new
  # GET /review_cats/new.xml
  def new
    @review_cat = ReviewCat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @review_cat }
    end
  end

  # GET /review_cats/1/edit
  def edit
    @review_cat = ReviewCat.find(params[:id])
  end

  # POST /review_cats
  # POST /review_cats.xml
  def create
    @review_cat = ReviewCat.new(params[:review_cat])

    respond_to do |format|
      if @review_cat.save
        flash[:notice] = 'ReviewCat was successfully created.'
        format.html { redirect_to(@review_cat) }
        format.xml  { render :xml => @review_cat, :status => :created, :location => @review_cat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @review_cat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /review_cats/1
  # PUT /review_cats/1.xml
  def update
    @review_cat = ReviewCat.find(params[:id])

    respond_to do |format|
      if @review_cat.update_attributes(params[:review_cat])
        flash[:notice] = 'ReviewCat was successfully updated.'
        format.html { redirect_to(@review_cat) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @review_cat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /review_cats/1
  # DELETE /review_cats/1.xml
  def destroy
    @review_cat = ReviewCat.find(params[:id])
    @review_cat.destroy

    respond_to do |format|
      format.html { redirect_to(review_cats_url) }
      format.xml  { head :ok }
    end
  end
end
