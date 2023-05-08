class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/venue_list.html.erb" })
  end

  def show
    venue_id = params.fetch("an_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.at(0)

    render({ :template => "venue_templates/details.html.erb" })
  end

  def create
    venue = Venue.new
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.save

    redirect_to("/venues/#{venue.id}")
  end
  
  def update
    the_id = params.fetch("an_id")
    venue = Venue.where({ :id => the_id })
    the_venue2 = venue.at(0)

    i_address = params.fetch("query_address")
    i_name = params.fetch("query_name")
    i_neighborhood = params.fetch("query_neighborhood")

    the_venue2.address = i_address
    the_venue2.name = i_name
    the_venue2.neighborhood = i_neighborhood
    the_venue2.save



    # venue.address = params.fetch("query_address")
    # venue.name = params.fetch("Query_name")
    # venue.neighborhood = params.fetch("query_neighborhood")
    # venue.save
    
    redirect_to("/venues/#{the_venue2.id.to_s}")
  end

  def destroy
    the_id = params.fetch("delete_id")
    matching_venues = Venue.where({ :id => the_id })
    @dlt_venue = matching_venues.at(0)
    
    @dlt_venue.destroy

    redirect_to("/venues")
    
  end

end
