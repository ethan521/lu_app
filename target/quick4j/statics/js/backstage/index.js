/**
 * Created by junming.qi on 2015/11/19.
 */
function addTab(title, url) {
    var cookie = getCookie("password");
    if (cookie == null || cookie == "") {

        top.location.reload();
    } else {
        if ($('#main-tabs').tabs('exists', title)) {
            $('#main-tabs').tabs('select', title);
        } else {
            var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
            $('#main-tabs').tabs('add', {
                title: title,
                content: content,
                closable: true
            });
        }
    }
}

