$(document).ready(function () {
    const editBtn = $("#editBtn");
    const submitBtn = $("#submitButton");
    const cancelBtn = $("#cancelBtn");
    const uploadBtn = $("#upload-profile-btn");
    const allInputs = [
        $("#Uploadphoto"),
        $("#input-first-name"),
        $("#input-last-name"),
        $("#input-age"),
        $("#input-phone"),
        $("#input-user-description"),
        $("#price"),
        $("#autocomplete"),
        $("#locality"),
        $("#route"),
        $("#street_number"),
        $("#postal_code"),
        $("#country"),
        $("#petName"),
        $("#petType"),
        $("#petDescription")
    ];
    $.each(allInputs, (i, input) => {
        input.attr("disabled", true);
    });
    submitBtn.hide(0);
    cancelBtn.hide(0);
    uploadBtn.hide(0);
    editBtn.click(() => {
        editBtn.hide(300);
        submitBtn.show(300);
        cancelBtn.show(300);
        uploadBtn.show(300);
        $.each(allInputs, (i, input) => {
            input.removeAttr("disabled");
        });
    });

    cancelBtn.click(() => {
        cancelBtn.hide(300);
        submitBtn.hide(300);
        uploadBtn.hide(300);
        editBtn.show(300);
        $.each(allInputs, (i, input) => {
            input.attr("disabled", true);
        });
    });
});