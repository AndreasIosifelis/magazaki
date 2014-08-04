/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var MZ = MZ || {};

MZ.init = function() {
    $(document).foundation({
        orbit: {
            animation: "fade",
            bullets: false,
            navigation_arrows: false,
            pause_on_hover: false,
            slide_number: false
        },
        top_bar: {
            custom_back_text: true,
            back_text: "Πίσω"
        }

    });
};

MZ.hash = function(v) {
    return CryptoJS.SHA512(v).toString();
};

MZ.FormSerialize = function(form) {
    var arr = form.serializeArray(),
            obj = {}, i, len;

    for (i = 0, len = arr.length; i < len; i++) {
        if (arr[i].name == "password") {
            obj[arr[i].name] = MZ.hash(arr[i].value);
        } else {
            obj[arr[i].name] = arr[i].value;
        }

    }
    return JSON.stringify(obj);
};


MZ.FormSubmit = function() {

    $("form[data-formtype='ajax']").on("submit", function(e) {
        e.preventDefault();

        var data = MZ.FormSerialize($(this));

        $.ajax({
            url: $(this).attr("action"),
            dataType: "json",
            method: "POST",
            data: {
                json: data
            },
            success: function(data) {

            },
            error: function(data) {

            }
        });

    });

};




$(function() {
    MZ.FormSubmit();
    MZ.init();
});

