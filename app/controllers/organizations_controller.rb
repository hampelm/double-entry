class OrganizationsController < ApplicationController
  def show
    @organization = Organization.find(params[:id])
  end

  def new
  end

  def create
    print params
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to @organization
    else
      render 'new'
    end
  end

  private
    def organization_params
      params.require(:organization).permit(:name, :nid)
    end
end
