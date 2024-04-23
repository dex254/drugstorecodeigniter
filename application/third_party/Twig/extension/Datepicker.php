<?php defined('BASEPATH') OR exit('No direct script access allowed');
/*
 * Datepicker.php
 *
 * A simple filter for Twig/Codeigniter to format and ensure a date field used for a datepicker has a sane default
 *
 * Requires: https://github.com/bmatschullat/Twig-Codeigniter
 *
 * See the readme for usage: https://github.com/kissit/Twig-Codeigniter-Datepicker/blob/master/README.md
 *
 * Copyright (C) 2019 team

*/
class Twig_Extensions_Extension_Datepicker extends Twig_Extension {

    public function getFilters() {
        return array(
            new Twig_SimpleFilter('datepicker', 'twig_datepicker_filter'),
        );
    }

    public function getName() {
        return 'Datepicker';
    }
}

function twig_datepicker_filter($value, $format = "Y-m-d") {
    $check = (int)strtotime($value);
    if($check <= 0) {
        $value = date($format);
    }
    return $value;
}
