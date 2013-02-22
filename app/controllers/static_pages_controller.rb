class StaticPagesController < ApplicationController

  def home
  end

  def data
  	require 'csv'

	start = Array.new(){Array.new()}
	i=1
	while i<3 do
		start.push(CSV.read(Rails.root.join("public/resources/#{i}.csv").to_s))
		i=i+1
	end

	data = Array.new()

	header = Array.new()

	i=0
	while i<start.size do
		header.push(start[i][0][0])
		i=i+1
	end

	j=1
	while j<start[0].size do
		k=1
		while k<start[0][0].size do
			i=0
			while i<start.size do
				if i==0
					data.push(start[i][j][0])
					data.push(start[i][0][k].to_i)
				end
				data.push(start[i][j][k].to_i)
				i=i+1
			end
			data.push(data[data.size-start[0][0].size])
			k=k+1
		end
		j=j+1
	end

	final = data.each_slice(start[0][0].size+1).to_a

	data_table = GoogleVisualr::DataTable.new

	data_table.new_column('string', 'Location' )
	data_table.new_column('number' , 'Date' )
	data_table.new_column('number', 'Sales' )
	data_table.new_column('number', 'Expenses')
	data_table.new_column('string', 'Location')

	# Add Rows and Values
	data_table.add_rows(final)

	option = { width: 400, height: 240, title: 'Country Performance' }
	@chart = GoogleVisualr::Interactive::MotionChart.new(data_table, option)
  end

  def about
  end

  def contact
  end
end
