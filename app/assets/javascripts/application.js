// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){
  $('.invite-btn').on('click',function(event){
    event.preventDefault();
    $('#project_id').val($(this).data('project')); 
    $('#myModal').modal('show');
  });
  
  $('#save-button').on('click', function(event){
    event.preventDefault();
    var project_id = $('#project_id').val();
    $('#project_id').val('');
    var invites = $('#invitations').val();
    $('#invitations').val('');
    $('#myModal').modal('hide');
    $.ajax({
      type: 'POST',
      url: "/invitations",
      data: {project_id: project_id, invites: invites },
      success: function(message) {
        alert(message);
      },
      failure: function(message) {
        alert('Something went wrong');
      }
    });

  });
  $('#save-comment').on('click', function(event){
    event.preventDefault();
    var feature_id = $('#feature_id').val();
    var new_comment = $('#new_comment').val().trim();
    $('#new_comment').val('');
    if(new_comment == ''){
      return
    }
    $.ajax({
      type: 'POST',
      url: "/comments.js",
      data: {feature_id: feature_id, new_comment: new_comment }
    });
  });
})
