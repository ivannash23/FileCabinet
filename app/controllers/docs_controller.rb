class DocsController < ApplicationController
  before_action :find_doc, only: [:show, :edit, :update, :destroy]


  def index
    @docs = Doc.all.order('created_at DESC')
  end
  
  def show   
  end
  
  def new
    @doc = current_user.docs.build
  end

  def create
    @doc = current_user.docs.build(doc_params)
    if @doc.save
      flash[:success] = "Doc successfully created"
      redirect_to @doc
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def edit
  end
  

  def update
    if @doc.update_attributes(doc_params)
      flash[:success] = "Doc was successfully updated"
      redirect_to @doc
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if @doc.destroy
      flash[:success] = 'Doc was successfully deleted.'
      redirect_to docs_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to docs_path
    end
  end
  

  private

    def find_doc
      @doc = Doc.find(params[:id])    
    end

    def doc_params
      params.require(:doc).permit(:title, :content)
      
    end

end
