class SentencesController < ApplicationController
  def index
    @sentences = Sentence.all
  end

  def show
    @sentence = Sentence.find(params[:id])
    @image = Image.find(@sentence.image_id)
  end

  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new(sentence_params)
    if @sentence.save
    flash[:notice] = "Sentence successfully added!"
      redirect_to  sentences_path
    else
      render :new
    end
  end

  def edit
    @sentence = Sentence.find(params[:id])
  end

  def update
    @sentence= Sentence.find(params[:id])
    if @sentence.update(sentence_params)
      flash[:notice] = "Sentence successfully updated!"
      redirect_to sentences_path
    else
      render :edit
    end
  end

  def destroy
    @sentence = Sentence.find(params[:id])
    if @sentence.destroy
      flash[:notice] = "Sentence successfully removed!"
      redirect_to sentences_path
    end
  end

private
  def sentence_params
    params.require(:sentence).permit(:content, :author, :image_id)
  end
end
