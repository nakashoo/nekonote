// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import $ from 'jquery';
window.jQuery = $;
window.$ = $;

import "jquery";
import "popper.js";
import "bootstrap";
import 'bootstrap-datepicker';

var jQuery = require("jquery");
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

require("@nathanvda/cocoon");

import "../stylesheets/application";
import "../stylesheets/base"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


//= require jquery-ui
//= require jquery-ui/widgets/datepicker


// $(document).on('turbolinks:load', function() {
//   $('.datepicker').datepicker({
//     dateFormat: 'yy/mm/dd', // 例: 2024/02/14
//     language: 'ja'
//     // その他のオプションをここに追加できます
//   });
// });

$(function() {
  $('#reservation_start_date').datepicker({
    format: 'yyyy/mm/dd'
  });
  $('#reservation_end_date').datepicker({
    format: 'yyyy/mm/dd'
  });
});