class Owners::FieldsController < Owners::ApplicationController
  before_action :set_field, only: [:show, :edit, :update, :destroy]

  def index
    @fields = current_owner.fields
  end

  def new
    @field = Field.new
  end

  def create
    @field = current_owner.fields.build(field_params)

    respond_to do |format|
      if @field.save
        format.html { redirect_to owners_fields_path, notice: 'Field was successfully created.' }
        format.json { render :show, status: :created, location: @field }
      else
        format.html { render :new }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to owners_fields_path, notice: 'Field was successfully updated.' }
        format.json { render :show, status: :ok, location: @field }
      else
        format.html { render :edit }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @field.destroy
    respond_to do |format|
      format.html { redirect_to owners_fields_path, notice: 'Field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_field
      @field = Field.find(params[:id])
    end

    def field_params
      params.require(:field).permit(:name, :address, :telephone)
    end
end
