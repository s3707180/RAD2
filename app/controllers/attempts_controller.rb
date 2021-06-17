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

  @@quizSource = nil
  @@sessionsQuestions = nil
  
  # GET /attempts/quiz ----------------------
  def quiz
    puts '------------------------------------'
    puts '------------- quiz start -----------'
    puts '------------------------------------'

    flash.notice = nil

    puts "params: #{params}"
    puts "session: #{session}"
    
    puts "session[:current_question_index]: #{session[:current_question_index]}"
    puts "session[:total_questions]: #{session[:total_questions]}"
    puts "session[:correct_answers]: #{session[:correct_answers]}"
    puts "request.session_options[:id]: #{request.session_options[:id]}"
    puts "session[:session_id]: #{session[:session_id]}"
    puts "session.id: #{session.id}"
    sessionId = session.id.to_s
    puts '-----------------------------'

    if session[:test_complete]
      session[:test_complete] = false
      session[:total_questions] = nil
      session[:correct_answers] = nil
      session[:current_question_index] = nil;
    end
    

    # load the questions if not done so already
    if (!@@quizSource)
        quizFile = File.read('quiz.json')
        @@quizSource = JSON.parse(quizFile)
        puts @@quizSource
    end    

    #if this is a new session and no question in the session

    if (!session[:current_question_index])
      session[:current_question_index] = 0
    end
    
    if (!session[:requested_number_of_questions])
      puts "******** Error, session[:requested_number_of_questions] was not set"
      session[:requested_number_of_questions] = 4
    end
    
    if (!@@sessionsQuestions)
      @@sessionsQuestions = Hash.new
    end
      
    puts "111111111 @@sessionsQuestions: #{@@sessionsQuestions}"
    puts "111111111 @@sessionsQuestions[sessionId]: #{@@sessionsQuestions[sessionId]}"
    
    if  !@@sessionsQuestions[sessionId]
      @@sessionsQuestions[sessionId] = @@quizSource.shuffle[0, session[:requested_number_of_questions]]
      puts "22222222222222 @@sessionsQuestions[sessionId]: #{@@sessionsQuestions[sessionId]}"
    end
    
    puts "333333333333 @@sessionsQuestions[sessionId]: #{@@sessionsQuestions[sessionId]}"
    puts "333333333333 @@sessionsQuestions[sessionId].size: #{@@sessionsQuestions[sessionId].size}"


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
            flash.notice = 'The provided answer is not acceptable. Please try again and select the answer(s)'
          else
            @currentQuestion = @@sessionsQuestions[sessionId][session[:current_question_index]]

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
            session[:current_question_index] += 1;
            
          end
        end
    end
    
    
    puts '----------------quiz end debug --------------------'
    puts "session[:current_question_index]: #{session[:current_question_index]}"
    puts "session[:correct_answers]: #{session[:correct_answers]}"


    # if the quiz is complete
    if (session[:current_question_index] >= session[:requested_number_of_questions])
      session[:test_complete] = true
      session[:total_questions] = session[:current_question_index]
      session[:current_question_index] = nil
      redirect_to action: "result", notice: "Showing Result."
      return
    end

     @currentQuestion = @@sessionsQuestions[sessionId][session[:current_question_index]]
     
     puts "44444444 @currentQuestion: #{@currentQuestion}, #{session[:current_question_index]}"
     puts "555555555 @@sessionsQuestions[sessionId]: #{@@sessionsQuestions[sessionId]}, size: #{@@sessionsQuestions[sessionId].size}"
  end


  def isCorrectAnswer(question, answer)
    puts '999999999999999999999999999'
    puts "question['correct_answers']: #{question['correct_answers']}"
    puts "answer: #{answer}"
    
    correctAnswers = question['correct_answers']
    
    puts "correctAnswers[answer+'_correct']: #{correctAnswers[answer+'_correct']}"
    
    return correctAnswers[answer+'_correct'] == "true"
  end


  # GET /attempts/start
  def start
    puts '------------------------------------'
    puts '------------- start start -----------'
    puts '------------------------------------'
    questionNumbers = params[:questionNumbers]
    puts "questionNumbers: #{questionNumbers}"
    if (questionNumbers)
      number_of_questions = questionNumbers.to_i
      puts "number_of_questions: #{number_of_questions}"
      if number_of_questions < 4 || number_of_questions > 8 
        flash.notice = "The provided value for number of questions is not acceptable"
      end
      session[:requested_number_of_questions] = number_of_questions
      redirect_to action: "quiz"
    end
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
