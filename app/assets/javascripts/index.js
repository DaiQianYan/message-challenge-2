$(document).ready(function() {
    $.get("/chat/new", function(data) {
        $("#roomId").val(data.key[0].room_id);
        $("#groupTitle").html('Chat with ' + data.key[0].title);

        // left group list
        var group = data.key;
        for (var i = 0; i < group.length; i++) {
            var groupList = '<a href="javascript:void(0);" onclick="roomMessages(' + group[i].room_id +', ' + group[i].mes_sender_id + ', \'' + group[i].title + '\')" id="' + group[i].room_id + '"name="message" ';
            if (i===0) {
                groupList += 'class="media active-message">';
            }else {
                groupList += '>';
            }
            groupList += '<img class="d-flex mr-3" src="https://robohash.org/' + group[i].mes_sender_id + '.png?set=set3" width="64" /> <div class="media-body">';
            groupList += '<strong>';
            
            // message read status set
            if (group[i].read_status === "unread" && i !== 0) {
                groupList += '<span class="badge badge-primary">Unread</span>';
            }

            groupList +=  'Chat with '+ group[i].title + '</strong><br/>' + group[i].body + '</div></a><hr/>';
            $('#groups').append(groupList);

        } //for end

        //click single group to get into the chat room
        $.get("/chat/"+ data.key[0].mes_sender_id +"/room/" + data.key[0].room_id, function(data) {
            data.k.reverse();
            messageAdding(data.k);
        });
    });
    //get end

    // submit
    $("#reply").click(function() {
        var roomId = $("#roomId").val();
        var userId = $("#userId").val();
        var content = $("#exampleTextarea").val();
        var escaped = $("<div>").text(content).html();
        var replyData = {"content": escaped, "roomId": roomId,"userId": userId};
        console.log(replyData);
        $.ajax({
            type: "POST",
            async: false,
            url: "/chat/create",
            dataType: "json",
            data: replyData,
            success: function(data) {
            }
        });
        $("#exampleTextarea").val('');
    });
    // alert(test());
});

// right message list
function messageAdding(data) {

    for (var i = 0; i < data.length; i++) {
        const html = `
        <div class="media">
        <img class="d-flex mr-3" src="${data[i].m_sender_avatar}" width="64" />
        <div class="media-body"><strong>${data[i].m_sender} said:</strong>
        <small class="text-muted">${moment(data[i].m_ctime).startOf('second').fromNow()}</small>
        <br/>
        ${data[i].m_body}
        </div>
        </div>
        <br/>
        `
        // var compiled = _.template('<div class="media"><img class="d-flex mr-3" src="${avatar}" width="64" /><div class="media-body"><strong>${name} said:</strong><small class="text-muted">moment( ${time} ).startOf(\'second\').fromNow()</small><br/>${message}</div></div><br/>');
        // compiled({ avatar: 'data[i].m_sender_avatar', name: data[i].m_sender, time: data[i].m_ctime, message: data[i].m_body });
        
        // var ctime = moment(data[i].m_ctime).startOf('second').fromNow();
        // // console.log(ctime);
        // var html = '<div class="media">';
        // html += '<img class="d-flex mr-3" src="'+ data[i].m_sender_avatar +'" width="64" />';
        // html += '<div class="media-body"><strong>'+ data[i].m_sender + ' said:</strong>';
        // html += '<small class="text-muted"> ( ' + ctime + ' ) </small>';
        // html += '<br/>'+ data[i].m_body +'</div></div><br/>'
        
        $("#messages").append(html);
        
    }
} 
// message list end

//message list with the same group click event
function roomMessages(roomId, userId, roomTitle) {
    $('a').removeClass("media active-message");
    $('#'+ roomId).addClass("media active-message");   
    //get single group chat record
    $.get("/chat/" + userId +"/room/"+ roomId, function(data) {
        $("#messages").empty();
        data.k.reverse();
        messageAdding(data.k);
    });

    //group list html change
    $("#groupTitle").html('Chat with ' + roomTitle);
    $(".badge").remove();
    $("#roomId").val(roomId);
}
