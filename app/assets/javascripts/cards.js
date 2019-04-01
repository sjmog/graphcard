$(document).ready(() => {
  $('#card_form').submit((e) => {
    const tags = $('.checkbox--tag:checked')
                  .toArray()
                  .map(checkbox => $(checkbox).attr("name").match(/card\[(.+)\]/)[1])

    $('#card_tag_list').val(tags);
  });
});