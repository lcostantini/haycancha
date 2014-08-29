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
    if @field.save
      redirect_to owners_fields_path, notice: 'Field was successfully created.'
    else
      render :new
    end
  end

  def update
    if @field.update(field_params)
      redirect_to owners_fields_path, notice: 'Field was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @field.destroy
    redirect_to owners_fields_path, notice: 'Field was successfully destroyed.'
  end

  private
    def set_field
      @field = Field.find(params[:id])
    end

    def field_params
      params.require(:field).permit(:name, :address, :telephone)
    end
end
