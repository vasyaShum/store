tinymce.init({
    selector: '.textareas'
});

function addField () {
    var telnum = parseInt($("#add_field_area").find("div.add:last").attr("id").slice(3)) + 1;
    $("div#add_field_area").append("<div id='add" + telnum +"' class='row add py-2'>" +
        "<input type='text' class='col-4 form-control' width='120' name='key[]' id='key'  value='' autocomplete='off' required/>" +
        "<input type='text' class='col-6 offset-1 form-control' width='120' name='value[]' id='value' value='' autocomplete='off' required>" +
        "<div onclick=\"removeField("+ telnum +");\" class=\"close col-1\" style=\"font-size: 30px\" aria-label=\"Close\">\n" +
        "                                    &times;\n" +
        "                                </div></div>");
}

function removeField(id) {
    $("div#add"+id).remove();
}