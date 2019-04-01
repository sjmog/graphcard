$(document).ready(() => {
  $('#card_form').submit((e) => {
    const checkboxTags = $('.checkbox--tag:checked')
                  .toArray()
                  .map(checkbox => $(checkbox).attr("name").match(/card\[(.+)\]/)[1])

    const newTags = $('#card_new_tags').val().split(", ")

    const tags = checkboxTags.concat(newTags);

    $('#card_tag_list').val(tags.join(", "));
  });
});