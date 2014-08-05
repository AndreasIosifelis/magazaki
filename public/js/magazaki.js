(function() {
    Array.prototype.contains = function(v) {
        var i, l = this.length;
        for (i = 0; i < l; i++) {
            if (this[i] === v || this[i] === v)
                return true;
        }
        return false;
    };

    Array.prototype.pushUnique = function(v) {
        !this.contains(v) ? this.push(v) : null;
        return this;
    };

    Array.prototype.getFirst = function() {
        return this[0];
    };

    Array.prototype.getLast = function() {
        return this[this.length - 1];
    };

    Array.prototype.removeAt = function(p, c) {
        c && c > 0 ? this.splice(p, c) : this.splice(p, 1);
    };
})();



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

        var form = $(this),
                data = MZ.FormSerialize(form),
                response = form.find("#response"),
                errorFunction = function(data) {
                    response.html("<div data-alert class='alert-box alert'>" + data.messages.join("<br/>") + "</div>");
                },
                successFunction = function(data) {
                    if (data.redirect) {
                        window.location.href = window.location.href;
                    }
                },
                callBackFunction = function(data) {
                    if(data.messages && data.messages.contains(101)){
                        window.location.href = window.location.href;
                    }
                    
                    
                    if (data.success) {
                        successFunction(data);
                    } else {
                        errorFunction(data);
                    }
                };
        response.html("<div data-alert class='alert-box info'>Παρακαλώ περιμένετε...</div>");
        $.ajax({
            url: form.attr("action"),
            dataType: "json",
            method: "POST",
            data: {
                json: data
            },
            success: callBackFunction,
            error: function(data) {
                alert(data);
            }
        });

    });

};




$(function() {
    MZ.FormSubmit();
    MZ.init();
});

