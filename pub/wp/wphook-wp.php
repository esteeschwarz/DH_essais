<?php
add_filter(
	'wp_unique_filename',
	function( $file_name, $ext, $dir, $cb, $alt, $no ) {
		if ( isset( $_POST[ 'action' ] ) && 'forminator_submit_form_custom-forms' === $_POST[ 'action' ] ) {
			if ( $no ) {
				$find          = '-' . $no . $ext;
				$original_name = str_replace( $find, $ext, $file_name );
				return $original_name;
			} else {
				return $file_name;
			}
		}

		return $file_name;
	},
	10,
	6
);
?>