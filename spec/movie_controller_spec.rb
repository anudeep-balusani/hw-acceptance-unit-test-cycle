#frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe MoviesController, type: :controller do


  describe '#create' do
        @movie_attr = {:title => 'xXx', :release_date => '12/12/2012', :director => 'xXx', :rating => 'PG-13'}
    it 'creates a movie' do
	    post  :create, :movie => {:title => 'xXx', :release_date => '12/12/2012', :director => 'xXx', :rating => 'PG-13'}
	    expect(Movie.all.any?{|movie| movie[:title]=='xXx'}).to be true 
    end 
  end

  @movie_attr = {:title => 'xXx', :release_date => '12/12/2012', :director => 'xXx', :rating => 'PG-13'}
  @movie = Movie.create(@movie_attr)
  
  describe '#destroy' do
    it 'deletes a movie' do

      @movie_attr = {:title => 'xXx', :release_date => '12/12/2012', :director => 'xXx', :rating => 'PG-13'}
      @movie = Movie.create(@movie_attr)
      delete :destroy, :id => @movie[:id] 
      expect(Movie.all.any?{|movie| movie[:title]=='Aladdin'}).to be false
    end
  end 

end

RSpec.describe MoviesHelper, type: :helper do
  describe '#oddness' do
    it 'determines odd or not' do
      expect(oddness(3)).to eq('odd')
    end
  end
end
