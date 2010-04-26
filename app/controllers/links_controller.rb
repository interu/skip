class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    link = Link.new(params[:link])
    link.tenant_id = current_tenant.id

    if link.save
      respond_to do |format|
        flash[:notice] = _('Created successfully.')
        format.html { redirect_to tenant_links_url(current_tenant) }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
      end
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        flash[:notice] = _('Updated successfully.')
        format.html { redirect_to tenant_links_url(current_tenant) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    Link.find_by_id(params[:id]).destroy
    respond_to do |format|
      flash[:notice] = _('Deletion complete.')
      format.html { redirect_to :action => 'index' }
    end
  end
end
