class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, :except => [:index, :show]

  # GET /questions
  # GET /questions.json
  def index
    # @questions = Question.all
    # @latest = @questions.reverse
    @highest = Question.order(:cached_votes_score).reverse
    # @open
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  def upvote
    if current_user.voted_as_when_voted_for @question # if user has liked this question, unlike it
      @question.unliked_by current_user
    else
      @question.liked_by current_user # otherwise, like it
    end
    redirect_to @question
  end

  def downvote
    unless (current_user.voted_as_when_voted_for @question) === false # if user has disliked it, undislike it
      @question.disliked_by current_user
    else # if user has not liked nor disliked, dislike it
      @question.undisliked_by current_user
    end
    redirect_to @question
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.answered = false
    @question.user_id = current_user.id

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:title, :body)
    end
end
