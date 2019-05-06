<?php

namespace App\Traits;

trait HashedRequest{

    public function sha( $input ){

        $input = sha1( $input );

        return $input;
    }
}
