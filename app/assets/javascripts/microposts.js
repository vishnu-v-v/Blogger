function repost(post_id) {
  $.ajax({
    method: 'POST',
    url: '/microposts',
    data: { micropost: { micropost_id: post_id } }
  }).done(function(msg) {

  });
}