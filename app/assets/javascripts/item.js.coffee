`$(document).ready(function(){
	$("#notice").fadeOut(4000);
    $('.col-xs-4').click(function(event){
        //remove all pre-existing active-statuses classes
        $('.active-status').removeClass('active-status');

        //add the active-status class to the image we clicked
        $(this).addClass('active-status');

        //set the value of the hidden field to the clicked status
        var currentStatus = $(this).attr("id");
        $("#item_status:hidden").val(currentStatus);
     });
});`