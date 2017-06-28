class StoriesController < ApplicationController
  def index
    @stories = Story.all.order(:title)
    @most_sentences = Story.most_sentences
    @contributor = Sentence.main_contributor
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
    flash[:notice] = "Story successfully added!"
      redirect_to  story_path(@story)
    else
      render :new
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story= Story.find(params[:id])
    if @story.update(story_params)
      flash[:notice] = "Story successfully updated!"
      redirect_to stories_path
    else
      render :edit
    end
  end

  def destroy
    @story = Story.find(params[:id])
    if @story.destroy
      flash[:notice] = "Story successfully removed!"
      redirect_to stories_path
    end
  end

  def most_sentences
    @stories = Story.most_sentences
    render
  end

private
  def story_params
    params.require(:story).permit(:title)
  end
end
