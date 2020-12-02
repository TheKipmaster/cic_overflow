class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_question, only: [:create]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  def upvote
    session[:return_to] ||= request.referer

    if current_user.voted_as_when_voted_for @answer # if user has liked this answer, unlike it
      @answer.unliked_by current_user
    else
      @answer.liked_by current_user # otherwise, like it
    end
    redirect_to session.delete(:return_to)
  end

  def downvote
    session[:return_to] ||= request.referer

    unless (current_user.voted_as_when_voted_for @answer) === false # if user has disliked this answer, undislike it
      @answer.disliked_by current_user
    else # if user has not liked nor disliked, dislike it
      @answer.undisliked_by current_user
    end
    redirect_to session.delete(:return_to)
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = @question.answers.new answer_params
    @answer.user = current_user
    @answer.score = 0

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:body)
    end
end
