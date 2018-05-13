$( document ).on('turbolinks:load', function() {
    if($('#truck_company_id').val()) {
        $.ajax({
            url: '/helpers/driver_select?selected_company_id=' + $('#truck_company_id').val(),
            type: 'GET',
            success: function (data) {
                var id = "select#truck_driver_id";
                $(id).children().remove();
                $(id).append($("<option></option>").attr("value", '').text('Select driver'));
                $.each(data, function (key, value) {
                    $(id).append($("<option></option>").attr("value", value.id).text(value.first_name + ' ' + value.last_name))
                });
            }
        });
    }
    $('#truck_company_id').on('change', function() {
        $.ajax({
            url: '/helpers/driver_select?selected_company_id=' + $('#truck_company_id').val(),
            type: 'GET',
            success: function (data) {
                var id = "select#truck_driver_id";
                $(id).children().remove();
                $(id).append($("<option></option>").attr("value", '').text('Select driver'));
                $.each(data, function (key, value) {
                    $(id).append($("<option></option>").attr("value", value.id).text(value.first_name + ' ' + value.last_name))
                });
            }
        });
    })});
