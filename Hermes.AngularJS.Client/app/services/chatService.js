app.factory('chatService', ['localStorageService', 'ordersService', function (localStorageService, ordersService) {
    var init = function () {
        var authData = localStorageService.get('authorizationData');

        $.signalR.ajaxDefaults.headers = { Authorization: authData.tokenType + " " + authData.token };

        //Set the hubs URL for the connection
        //$.connection.hub.url = "http://localhost:50534/signalr";
        $.connection.hub.url = "http://localhost/OAuth.Messaging/signalr";

        $.connection.hub.qs = { 'BearerToken': authData.token };

        // Declare a proxy to reference the hub.
        var chat = $.connection.chatHub,
            // Declare a proxy to reference the hub.
            notifications = $.connection.notificationHub,
            timer = 0;

        chat.client.heartbeat = function () {
            console.log('Heart Beat');
            console.log(arguments);
        };

        chat.client.groupHandShake = function (username) {
            console.log(username);
        };

        // Create a function that the hub can call to broadcast messages.
        chat.client.tick = function (connectionId, name, message) {
            console.log(arguments);
        };

        // Create a function that the hub can call to broadcast messages.
        notifications.client.recieveNotification = function () {
            ordersService.getOrders();
        };

        function Connect(isReconnecting) {
            // Start the connection.
            $.connection.hub.start()
                .done(function () {
                    //notifications.server.sendNotifications();
                    chat.server.register()
                        .done(function (user) {
                            if (user) {
                                // Call the group hand shake method on the hub.
                                chat.server.groupHandShake();
                                console.log(user);
                            }
                        });
                })
                .fail(function () {
                });
        }

        // connect to the signalR hub
        Connect();
    },
    logout = function () {
        $.connection.chatHub.server.close();
    };

    return {
        init: init,
        get chatHub() {
            return $.connection.chatHub;
        },
        logout: logout

    };
}]);