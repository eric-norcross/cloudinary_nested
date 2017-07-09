class SkusController < ApplicationController
  before_action :set_sku, only: [:show, :edit, :update, :destroy]

  # GET /skus
  # GET /skus.json
  def index
    @skus = Sku.all
  end

  # GET /skus/1
  # GET /skus/1.json
  def show
  end

  # GET /skus/new
  def new
    if request.xhr?
      parent_form_builder = DynamicFormBuilderService.new(:product, Product.new, view_context, {})
      
      render_association(parent_form_builder, params[:with_image])
    end
  end

  # GET /skus/1/edit
  def edit
  end

  # POST /skus
  # POST /skus.json
  def create
    @sku = Sku.new(sku_params)

    respond_to do |format|
      if @sku.save
        format.html { redirect_to @sku, notice: 'Sku was successfully created.' }
        format.json { render :show, status: :created, location: @sku }
      else
        format.html { render :new }
        format.json { render json: @sku.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skus/1
  # PATCH/PUT /skus/1.json
  def update
    respond_to do |format|
      if @sku.update(sku_params)
        format.html { redirect_to @sku, notice: 'Sku was successfully updated.' }
        format.json { render :show, status: :ok, location: @sku }
      else
        format.html { render :edit }
        format.json { render json: @sku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skus/1
  # DELETE /skus/1.json
  def destroy
    @sku.destroy
    respond_to do |format|
      format.html { redirect_to skus_url, notice: 'Sku was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sku
      @sku = Sku.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sku_params
      params.require(:sku).permit(
        :id,
        :product_id,
        :identifier, 
        
        # has_many (Polymorphic)
        { :images_attributes => [
          :_destroy,
          :id,
          :caption,
          :link,
          :title,
          :alt,
          :image,

          # polymorphic
            :imageable_type
        ]},
      )
    end

    def render_association(parent_association, with_image=false)
      partial     = with_image ? '/skus/_nested_fields_with_image' : '/skus/_nested_fields'

      child_index = Time.now.to_i
      
      new_sku     = Sku.new
      new_sku.images.build

      parent_association.send(:fields_for, "product[skus_attributes][#{child_index}]", new_sku, { child_index: child_index }) do |builder|
        render partial, locals: { f: builder }, layout: false
      end
    end
end
