$(function($) {
  $('#edit-photo').Jcrop();
});

function update_crop(coords) {
  $('#crop_x').val(coords.x);
  $('#crop_y').val(coords.y);
  $('#crop_w').val(coords.w);
  $('#crop_h').val(coords.h);
}

jQuery(function($) {
    $('#edit-photo').Jcrop({
        bgColor:     'black',
        bgOpacity:   .4,
        aspectRatio: 7 / 5,
        onChange: update_crop,
        onSelect: update_crop,
    });
});
