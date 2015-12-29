// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require moment
//= require moment/ru
//= require bootstrap-sprockets
//= require bootstrap
//= require bootstrap-datetimepicker

//= require jquery.plugin
//= require jquery.base64
//= require tableExport
//= require jquery.datepick
//= require jquery.datepick-ru
//= require bootstrap-table
//= require bootstrap-table-ru-RU
//= require bootstrap-table-cookie
//= require bootstrap-table-export
function colorer(value, row) {
    return '<span style="background-color: ' + row.color + '">' + row.id + '</span>';
}
$(document).ready(function () {
        $('.dropdown-toggle').dropdown();
    }
);
