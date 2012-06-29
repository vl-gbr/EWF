note
	description: "[
					cURL form.
					For more informaton see:
					http://curl.haxx.se/libcurl/c/curl_formadd.html
																		]"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	CURL_FORM

inherit
	DISPOSABLE

create
	make,
	share_with_pointer

feature {NONE} -- Initialization

	make
			-- Creation method.
		do
		end

	share_with_pointer (a_pointer: POINTER)
			-- Creation method.
			-- `item' share with `a_pointer'.
		require
			exists: a_pointer /= default_pointer
		do
			item := a_pointer
		ensure
			set: item = a_pointer
		end

feature -- Query

	item: POINTER
			-- C pointer of Current.

	is_exists: BOOLEAN
			-- If C pointer exists?
		do
			Result := item /= default_pointer
		end

feature -- Command

	dispose
			-- Free memory if possible.
		local
			l_curl: CURL_EXTERNALS
		do
			if item /= default_pointer then
				create l_curl
				l_curl.formfree (item)
				item := default_pointer
			end
		end

	release_item
			-- Release item
			-- NOT free memory! This is useful if Current generated by {CURL_EXTERNALS}.formadd_string_string.
		do
			item := default_pointer
		end

feature {CURL_EXTERNALS} -- Internal command	

	set_item (a_item: POINTER)
			-- Set `item' with `a_item'
		do
			item := a_item
		ensure
			set: item = a_item
		end

note
	library:   "cURL: Library of reusable components for Eiffel."
	copyright: "Copyright (c) 1984-2006, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			356 Storke Road, Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end