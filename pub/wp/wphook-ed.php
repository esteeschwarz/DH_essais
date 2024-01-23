add_filter( 'wp_handle_upload_prefilter', 'overwrite_existing_files' );

function overwrite_existing_files( $file ) {
    $upload_dir = wp_upload_dir();
    $target_path = $upload_dir['path'] . '/' . $file['name'];
    if ( file_exists( $target_path ) ) {
        unlink( $target_path );
    }
    return $file;
}
