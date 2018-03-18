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
//= require jquery3
//= require jquery_ujs
//= require jquery.turbolinks
// JavaScriptが正常に動かないため一旦停止
// require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker


var data = {'data-date-format': 'YYYY-MM-DD' };
$(function(){
  $('.datepicker').attr(data);
  $('.datepicker').datetimepicker();
});


function overdue(){
var table = document.getElementById("work_list");
var new_date = new Date();
var today =
    new_date.getFullYear() + '/' + ("0"+(new_date.getMonth() + 1)).slice(-2) + '/' + new_date.getDate();
for (var i =0,Row=table.rows.length;i<Row;i++)
  for(var j=0,colren=table.rows[i].cells.length;j<colren;j++){
    if (table.rows[i].cells[2].innerText < today){
      table.rows[i].style.backgroundColor='#CC0000'
      table.rows[i].style.color='WHITE'
    }
  }
}
