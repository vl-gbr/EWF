note
	description: "Summary description for {WSF_GRID_COLUMN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	WSF_GRID_COLUMN

create
	make

feature {NONE} -- Initialization

	make (a_header, a_field: STRING)
		do
			header := a_header
			field_name := a_field
			sorting_name := a_field
		end

feature -- Render

	render_column (e: WSF_ENTITY): STRING
			-- Return the rendered column cell for a specific entity (row)
		do
			if attached e.item (field_name) as data then
				Result := data.out
			else
				Result := "[VOID]"
			end
		end

feature -- Properties

	header: STRING

	sortable: BOOLEAN

	sorting_name: STRING

	field_name: STRING

end
