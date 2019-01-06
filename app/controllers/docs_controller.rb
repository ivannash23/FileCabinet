class DocsController < ApplicationController
  before_action :find_doc, only: [:show, :edit, :update, :destroy]


  def index
    @docs = Doc.all.order('created_at DESC')
  end
  

  def show
    
  end
  
  def new
    @doc = Doc.new
  end

  def create
    @docs = Doc.new(doc_params)
    if @docs.save
      flash[:success] = "Doc successfully created"
      redirect_to @docs
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

    def find_doc
      @doc = Doc.find(params[:id])    
    end

    def doc_params
      params.require(:doc).permit(:title, :content)
      
    end

end
