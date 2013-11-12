class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.xml
   before_filter :authenticate_user!, :only => [ :edit, :new, :update ]
   load_and_authorize_resource
   layout '/layouts/recipe'
   
  def index
    if params[:category_id].nil?
      @recipes = Recipe.find(:all)
    else
      @recipes = Recipe.find(:all,
                            :conditions => ["category_id = ?", params[:category_id]])
      params[:category_id] = nil
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
    end
  end
 # GET /recipes/1/review
  def review
    @recipe = Recipe.find(params[:id])
  end
   
  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  def list
 #   rcat = "1 = 0"
#if params[:all] then rcat = "1 = 1" end
#if params[:rcat] then params[:rcat].each_value {|category| rcat += " or category_id = #{category}" } end
#@from = Time.new(params["from(1i)"].to_i, 10, 1)
#@to = Time.new(2013, 10, 31)
#@recipes_list = Recipe.find_by_sql ["SELECT * FROM recipes WHERE (#{rcat}) and created_at >= ? and created_at <= ?",@from,@to]
#@recipes_list = Recipe.find_all_by_category_id(params[:category])
@by = params[:by]
@attr = params[:attr] 
case @by
when "author"
  @recipes_list = Recipe.joins(:user).where("users.name = ?",@attr)
when "category"
  @recipes_list = Recipe.find_all_by_category_id(@attr)
when "ingredient"
  @recipes_list = Recipe.where("ingredients LIKE ?",'%' + @attr + '%')
when "rating"
  @recipes_list = Recipe.find_by_rating(@attr)
when "potluck"
  @recipes_list = Recipe.find_by_potluck(@attr)
else
  @recipes_list = Recipe.newest(5)
end

end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user_id = current_user.id
   
    respond_to do |format|
      if @recipe.save
        flash[:notice] = 'Recipe was successfully created.'
        format.html { redirect_to(@recipe) }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        flash[:notice] = 'Recipe was successfully updated.'
        format.html { redirect_to(@recipe) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(recipes_url) }
      format.xml  { head :ok }
    end
  end
end
