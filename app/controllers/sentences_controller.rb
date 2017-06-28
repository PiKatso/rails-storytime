class SentencesController < ApplicationController
  def index
    @sentences = Sentence.all
  end

  def show
    @sentence = Sentence.find(params[:id])
    @image = Image.find(@sentence.image_id)
  end

  def new
    @story = Story.find(params[:story_id])
    @image = Image.order("RANDOM()").first
    @sentence = Sentence.new
  end

  def create
    @story = Story.find(params[:story_id])
    @sentence = @story.sentences.new(sentence_params)
    if @sentence.save
    flash[:notice] = "Sentence successfully added!"
      redirect_to  story_path(@story)
    else
      render :new
    end
  end

  def edit
    @story = Story.find(params[:story_id])
    @sentence = Sentence.find(params[:id])
    @image = Image.find(@sentence.image_id)
  end

  def update
    @sentence= Sentence.find(params[:id])
    if @sentence.update(sentence_params)
      flash[:notice] = "Sentence successfully updated!"
      redirect_to story_path(@sentence.story)
    else
      render :edit
    end
  end

  def destroy
    @sentence = Sentence.find(params[:id])
    if @sentence.destroy
      flash[:notice] = "Sentence successfully removed!"
      redirect_to story_path(@sentence.story)
    end
  end

private
  def sentence_params
    params.require(:sentence).permit(:content, :author, :image_id)
  end
end
