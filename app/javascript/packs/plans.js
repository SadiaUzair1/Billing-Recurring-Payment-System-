$(() => {
  $("#checkout_plans").on('click', function() {

    var selected_plans = [];
    $('.subscribed_plan_checkbox:checked').each(function() {
      selected_plans.push($(this).attr('value'));
    });
    alert('Wait for few seconds');

    url_data = {'selected_plans' : selected_plans }
    $.ajax({
      type: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: 'checkouts/create',
      data: url_data
    });
  });
})
