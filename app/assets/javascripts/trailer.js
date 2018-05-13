$( document ).on('turbolinks:load', function() {
    if($('#trailer_company_id').val()) {
        $.ajax({
            url: '/helpers/truck_select?selected_company_id=' + $('#trailer_company_id').val(),
            type: 'GET',
            success: function (data) {
                var id = "select#trailer_truck_id";
                $(id).children().remove();
                $(id).append($("<option></option>").attr("value", '').text('Select truck'));
                $.each(data, function (key, value) {
                    $(id).append($("<option></option>").attr("value", value.id).text(value.reg_number))
                });
            }
        });
    }
    $('#trailer_company_id').on('change', function() {
        $.ajax({
            url: '/helpers/truck_select?selected_company_id=' + $('#trailer_company_id').val(),
            type: 'GET',
            success: function (data) {
                var id = "select#trailer_truck_id";
                $(id).children().remove();
                $(id).append($("<option></option>").attr("value", '').text('Select truck'));
                $.each(data, function (key, value) {
                    $(id).append($("<option></option>").attr("value", value.id).text(value.reg_number))
                });
            }
        });
    })});
