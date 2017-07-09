$(document).on("click", "#add-nested-skus", function(event) {
  event.stopImmediatePropagation();

  var insertNode = $(this).parent().find('#nested-skus');
  
  console.log("");
  console.log("--------------------------------------------------");
  console.log("Adding Nested Skus...");
  console.log("insertNode: ", insertNode);
  console.log("--------------------------------------------------");
  console.log("");

  var request = $.ajax({
    url:  "/skus/new",
    type: "GET"
  });
  
  request.done(function(data, textStatus, jqXHR) {
    console.log("");
    console.log("--------------------------------------------------");
    console.log("--Success--");
    console.log("data: ", data);
    console.log("textStatus: ", textStatus);
    console.log("jqXHR: ", jqXHR);
    console.log("jqXHR.status: ", jqXHR.status);
    console.log("jqXHR.getResponseHeader('response'): ", jqXHR.getResponseHeader('response')); //This is a custom message e.g.: Success!
    console.log("--------------------------------------------------");
    console.log("");

    console.log("this: ", this);
    console.log("$(this): ", $(this));

    insertNode.append(data);
  });
   
  request.fail(function(jqXHR, textStatus, errorThrown) {
    console.log("");
    console.log("--------------------------------------------------");
    console.log("--Failure--");
    console.log("jqXHR: ", jqXHR);
    console.log("textStatus: ", textStatus);
    console.log("errorThrown: ", errorThrown);
    console.log("jqXHR.status: ", jqXHR.status);
    console.log("--------------------------------------------------");
    console.log("");
  });
  
});

$(document).on("click", "#add-nested-skus-with-image", function(event) {
  event.stopImmediatePropagation();

  var insertNode = $(this).parent().find('#nested-skus');
  
  console.log("");
  console.log("--------------------------------------------------");
  console.log("Adding Nested Skus...");
  console.log("insertNode: ", insertNode);
  console.log("--------------------------------------------------");
  console.log("");

  var request = $.ajax({
    url:  "/skus/new",
    type: "GET", 
    data: { with_image: true }
  });
  
  request.done(function(data, textStatus, jqXHR) {
    console.log("");
    console.log("--------------------------------------------------");
    console.log("--Success--");
    console.log("data: ", data);
    console.log("textStatus: ", textStatus);
    console.log("jqXHR: ", jqXHR);
    console.log("jqXHR.status: ", jqXHR.status);
    console.log("jqXHR.getResponseHeader('response'): ", jqXHR.getResponseHeader('response')); //This is a custom message e.g.: Success!
    console.log("--------------------------------------------------");
    console.log("");

    console.log("this: ", this);
    console.log("$(this): ", $(this));

    insertNode.append(data);
  });
   
  request.fail(function(jqXHR, textStatus, errorThrown) {
    console.log("");
    console.log("--------------------------------------------------");
    console.log("--Failure--");
    console.log("jqXHR: ", jqXHR);
    console.log("textStatus: ", textStatus);
    console.log("errorThrown: ", errorThrown);
    console.log("jqXHR.status: ", jqXHR.status);
    console.log("--------------------------------------------------");
    console.log("");
  });
  
});

// ==================================================================
// Cloudinary
// ==================================================================
  var cloudinaryUploaderInit = function() {
    // console.log("cloudinaryUploaderInit");
    if ($.fn.cloudinary_fileupload !== undefined) {
      $("input.cloudinary-fileupload[type=file]").each(function() {
        $(this).cloudinary_fileupload();
      });
    } else {
      console.log("`cloudinary_fileupload` is undefined");
    }
  }


// ==================================================================
// Init
// ==================================================================
  $(document).on('turbolinks:load', function() {

    // Init Cloudinary Fields
    $(function() {
      cloudinaryUploaderInit();
    });
  });