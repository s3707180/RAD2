  require 'json'

class AttemptsController < ApplicationController
  before_action :set_attempt, only: %i[ show edit update destroy ]

  # GET /attempts or /attempts.json
  def index
    @attempts = Attempt.all
  end

  # GET /attempts/1 or /attempts/1.json
  def show
  end


  # GET /attempts/new
  def new
    @attempt = Attempt.new
  end

  # GET /attempts/result
  def result
    puts '-----------------------------'
    puts '------------- result -----------'
    puts '-----------------------------'

    puts "session[:total_questions]: #{session[:total_questions]}"
    puts "session[:correct_answers]: #{session[:correct_answers]}"
    puts " session[:previous_results]: #{ session[:previous_results]}"
    
    @totalQuestions = session[:total_questions]
    @correctAnswers = session[:correct_answers]
    
    @message = "you answered #{@correctAnswers}/#{@totalQuestions} questions correctly"
    
    # session[:previous_results] = []
    if !session[:previous_results]
      session[:previous_results] = []
    end
    # @preResults = session[:previous_results].split('|')
    @preResults = session[:previous_results]
    
    if (session[:previous_results].size >=5)
      session[:previous_results] = session[:previous_results][1,4]
    end
    
    session[:previous_results] << 'At ' + Time.now.getlocal('+10:00').strftime("%I%P %d-%m-%y %z") + ', ' + @message
    
    puts " session[:previous_results]: #{ session[:previous_results]}"
    puts Time.now.strftime("%H%P %d-%m-%Y")

  end

  TOTAL_QUESTIONS = 4
  @@quizSource = nil
  # GET /attempts/quiz ----------------------
  def quiz
    puts '------------------------------------'
    puts '------------- quiz start -----------'
    puts '------------------------------------'

    puts "params: #{params}"
    puts "session: #{session}"
    
    puts "session[:current_question_index]: #{session[:current_question_index]}"
    puts "session[:total_questions]: #{session[:total_questions]}"
    puts "session[:correct_answers]: #{session[:correct_answers]}"
    puts '-----------------------------'


    if session[:test_complete]
      session[:test_complete] = false
      session[:total_questions] = 0
      session[:correct_answers] = 0
    end


    # load the questions if not done so already
    if (!@@quizSource)
        quizFile = File.read('quiz.json')
        @@quizSource = JSON.parse(quizFile)
        puts @@quizSource
    end    

    #if this is a new session and no question in the session

    if (!session[:current_question_index])
      session[:current_question_index] = getRandomeQuestion(@@quizSource.size);
    end

    
    if (!session[:total_questions])
      session[:total_questions] = 0
    end

    if (!session[:correct_answers])
      session[:correct_answers] = 0
    end



    # if a quesion is answered
    if (params[:commit])
        puts '--  answer --'
        if (params[:commit] == 'Submit')
          puts '--  answer submitted  --'
          if (!params[:answer] || params[:answer] == nil || params[:answer] == "" )
            # answer is not acceptable
            puts '***** answer is not acceptable'
          else
            @currentQuestion = @@quizSource[session[:current_question_index]]

            answer = params[:answer]
            puts "3333333333333333333"
            puts "answer::#{answer}"
            puts "params[:answer]:: #{params[:answer]}"
            
            result = isCorrectAnswer(@currentQuestion, answer)
            puts "result: #{result}"
            
            if result == true
              # puts "session[:correct_answers]: #{session[:correct_answers]}"
              session[:correct_answers] += 1;
            end
            session[:total_questions] += 1;
            
            #select a new question
            session[:current_question_index] = getRandomeQuestion(@@quizSource.size);
          end
        end
    end
    
    
    puts '----------------quiz end debug --------------------'
    puts "session[:total_questions]: #{session[:total_questions]}"
    puts "session[:correct_answers]: #{session[:correct_answers]}"


    if (session[:total_questions] >= TOTAL_QUESTIONS)
      session[:test_complete] = true
      redirect_to action: "result", notice: "Showing Result."
      return
    end

    @currentQuestion = @@quizSource[session[:current_question_index]]
  end

  def getRandomeQuestion size
    rand(size)
  end
  
  
  def isCorrectAnswer(question, answer)
    puts '999999999999999999999999999'
    puts "question['correct_answers']: #{question['correct_answers']}"
    puts "answer: #{answer}"
    
    correctAnswers = question['correct_answers']
    
    puts "correctAnswers[answer+'_correct']: #{correctAnswers[answer+'_correct']}"
    
    return correctAnswers[answer+'_correct'] == "true"
  end

  # GET /attempts/1/edit
  def edit
  end

  # POST /attempts or /attempts.json
  def create
    @attempt = Attempt.new(attempt_params)

    respond_to do |format|
      if @attempt.save
        format.html { redirect_to @attempt, notice: "Attempt was successfully created." }
        format.json { render :show, status: :created, location: @attempt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attempts/1 or /attempts/1.json
  def update
    respond_to do |format|
      if @attempt.update(attempt_params)
        format.html { redirect_to @attempt, notice: "Attempt was successfully updated." }
        format.json { render :show, status: :ok, location: @attempt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attempts/1 or /attempts/1.json
  def destroy
    @attempt.destroy
    respond_to do |format|
      format.html { redirect_to attempts_url, notice: "Attempt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attempt
      @attempt = Attempt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attempt_params
      params.require(:attempt).permit(:dateandtime, :category, :difficulty, :questionsList, :questionnum, :questioncorrect)
    end
end
