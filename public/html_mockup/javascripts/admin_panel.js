$(document).ready(function() {
  $('#example').dataTable({
    "aaSorting": [[ 4, "desc" ]],
	  bDestroy: true,
	  "oLanguage": {
	      sUrl: "lib/dataTables.ukrainian.txt"
	  }
  });

  $("select").selectBoxIt({
    theme: "bootstrap"
  });

});
