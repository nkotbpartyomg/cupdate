`$(document).ready(function(){
	$("#notice").delay(5000).fadeOut(1000);
    $('.popover-dismiss').popover({
    trigger: 'focus'
    });
    $('.tip').tooltip();
    $('.single-status').click(function(event){
        //remove all pre-existing active-statuses classes
        $('.active-status').removeClass('active-status');

        //add the active-status class to the image we clicked
        $(this).addClass('active-status');

        //set the value of the hidden field to the clicked status
        var currentStatus = $(this).attr("id");
        $("#item_status:hidden").val(currentStatus);
     });
});`