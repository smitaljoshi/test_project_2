class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
        
    end
    def index
        @articles = Article.all
    end
    def new
        #initiating @article variable here because very first time @article variable not found once 
        #create controller calles then only will find this variable
        @article = Article.new
    end
    def edit
       
    end
    def create
        #render plain: params[:article]
        @article = Article.new(article_params)
        #render plain: @article.inspect
        if @article.save
        #here article is prefix of show routes and need to add _path
        #because in routes in url its expectig id we are passing here @article and it will fetch id from variable
        #redirect_to article_path(@article)
        #we can also write line as below instead of above
        #to fire validation will add if clause here
        #to dispay success msg, will use alert instead of notice for failure
        #will call this flash messages in application application.html.erb as all view using this
        flash[:notice] = "Saved successfully."
        redirect_to @article
        else
            #this will call new html page
            render 'new'
        end

    end
    def update
        
        if @article.update(article_params)
            flash[:notice] = "Edited Successfully"
            redirect_to @article
        else
            render 'edit'
        end
    end
    def destroy
        
        @article.destroy
        redirect_to articles_path #here articles is prefix of listing route and add _path to it
    end 

    private
        def set_article
            @article = Article.find(params[:id])
        end
        def article_params
            params.require(:article).permit(:title, :description)
        end
end
