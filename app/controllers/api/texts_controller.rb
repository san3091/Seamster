module API
  class TextsController < ApplicationController
    before_action :set_text, only: [:show, :edit, :update, :destroy, :create_relation]
    before_action :set_related_text, only: [:create_relation]

    # GET /texts
    # GET /texts.json
    def index
      @texts = Text.all
      render json: @texts
    end

    # GET /texts/1
    # GET /texts/1.json
    def show
      render json: @text
    end

    # GET /texts/new
    def new
      @text = Text.new
    end

    # GET /texts/1/edit
    def edit
    end

    # POST /texts/1
    def create_relation 
      # Build bi-directional relation between texts
      @text.related_texts << @related_text
      @related_text.related_texts << @text
      render json: @text.related_texts
    end

    # POST /texts
    # POST /texts.json
    def create
      @text = Text.new(text_params)

      respond_to do |format|
        if @text.save
          format.json { render :show, status: :created, location: api_text_url(@text) }
        else
          format.json { render json: @text.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /texts/1
    # PATCH/PUT /texts/1.json
    def update
      respond_to do |format|
        if @text.update(text_params)
          format.json { render :show, status: :ok, location: @text }
        else
          format.json { render json: @text.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /texts/1
    # DELETE /texts/1.json
    def destroy
      @text.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_text
        @text = Text.find(params[:id])
      end

      def set_related_text
        @related_text = Text.find(params[:related_text_id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def text_params
        params.require(:text).permit(:title, :body)
      end
  end
end
