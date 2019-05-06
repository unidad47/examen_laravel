<?php

namespace App\Traits;

trait SanitizedRequest{

    public function sanitize( $input ){

        $input = substr( str_replace( array( "'",'"' ),'',
                                stripslashes(
                                    strip_tags( trim( $input ) )
                                ) ), 0, 61 );

        return $input;
    }
}
