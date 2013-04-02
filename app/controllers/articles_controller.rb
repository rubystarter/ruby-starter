class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  before_filter :authenticate_user!, except: [:show, :index, :search]
  before_filter :find_article, only: [:show, :edit, :update, :destroy, :vote]

  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    @topics = Topic.all()

    if user_signed_in?
      find_vote(@article)
    end

    @average = get_average(@article)

    @feedback = Feedback.new
    
    @article.views = views_increase(@article)

    @article.save

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    @article.user_id = current_user.id


    respond_to do |format|
      if @article.save

        #QuestionsMailer.comment_notfication(current_user, @article).deliver
        #QuestionsMailer.delay.comment_notfication(current_user, @article)

        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /articles/search
  def search
    if (params[:search].length>0)
      searchParam = "%" + params[:search] + "%"
      @exception = ""
      begin
        @articles = Article.where("title like ? or content like ?", searchParam, searchParam)
      rescue StandardError=>e
        @exception = e
      end

      respond_to do |format|
        format.js
      end
    end
  end

  # POST /articles/1/vote
  def vote
    if (params[:rating].length>0)

        found = find_vote(@article)

        if (found)
          #Vote.where("id=?", @vote.id).update_all("rating=?", params[:rating].to_i)
          @vote.rating = params[:rating].to_i
          @vote.save          
        else
          @vote.user_id = current_user.id
          @vote.article_id = @article.id
          @vote.rating = params[:rating].to_i

          @vote.save
        end

        @average = get_average(@article)

        respond_to do |format|
          format.js
        end
    end    
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private

  def find_article
    @article = Article.find(params[:article_id] || params[:id])
  end

  def find_vote(article)
    yourVote  = Vote.where("article_id = ? and user_id = ?", article.id, current_user.id)
    if (yourVote.length>0)
      @vote = yourVote.first
      true
    else
      @vote = Vote.new
      false
    end
  end  

  def get_average(article)
    @average = Vote.where("article_id = ?", article.id).average("rating")
  end

  def views_increase(article)
      if (article.views.nil?)
        views = 1
      else
        views = article.views + 1
      end
  end 

end
