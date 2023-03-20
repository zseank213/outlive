// import 'dart:developer';
//
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:laravel_echo/laravel_echo.dart';
// import 'package:ICDX/lib.dart';
//
// class MySocket {
//   late IO.Socket socket;
//   late Echo echo;
//   late MySocketContract mySocketContract;
//
//   final String _url = 'wss://websocket-bazar.immortal-universe.com/';
//
//   void setListener(MySocketContract p_mySocketContract) {
//     mySocketContract = p_mySocketContract;
//   }
//
//   Future<void> connect() async {
//     try {
//       final token = await SecureStorage.getAccessToken();
//
//       // Create socket.io client
//       socket = IO.io(
//         _url,
//         IO.OptionBuilder().setExtraHeaders({'Accept': 'application/json'}).disableAutoConnect().enableReconnection().setTransports(['websocket']).build(),
//       );
//
//       // Create echo instance
//       echo = Echo(
//         broadcaster: EchoBroadcasterType.SocketIO,
//         client: socket,
//         options: {
//           'auth': {
//             'headers': {
//               'Authorization': 'Bearer $token',
//             }
//           },
//         },
//       );
//
//       socket.on('message', (data) {
//         print("Received $data");
//       });
//
//       socket.onDisconnect((_) => log('onDisconnect:' + _.toString()));
//       socket.onConnectError((_) {
//         log('onConnectError:' + _.toString());
//         socket.dispose();
//       });
//       socket.onError((data) => log('onConnectError:' + data.toString()));
//       socket.onConnecting((data) => log('onConnecting:' + data.toString()));
//
//       socket.on('connect', (_) {
//         log('socket.id: ${socket.id}');
//         log('isConnected: ${socket.connected}');
//       });
//       socket.on('disconnect', (_) => log('disconnect'));
//       socket.on('fromServer', (_) => log(_.toString()));
//     } catch (e) {
//       log('exception : ' + e.toString());
//     }
//   }
//
//   Future<void> disconnect() async {
//     try {
//       // Disconnect to websocket
//       echo.disconnect();
//       socket.dispose();
//       log('disconnect Socket');
//     } catch (e) {
//       log('disconnect exception : ' + e.toString());
//     }
//   }
//
//   // listenToUserDetailOrderUpdateChannel
//   Future<void> listenListAuction() async {
//     try {
//       log('listenListAuctionChannel..');
//       echo.channel('ListAuctionUpdate').listen('.ListAuctionUpdate', (data) {
//         log('listenListAuctionChannel : ' + data.toString());
//         mySocketContract.listenListAuction(data.toString());
//       });
//     } catch (e) {
//       log('listenListAuctionChannel exception : ' + e.toString());
//     }
//   }
//
//   // listenToUserDetailOrderUpdateChannel
//   Future<void> listenNewLoginDetected(String uuid) async {
//     try {
//       log('listenNewLoginDetectedChannel..');
//       echo.channel('NewLoginDetected.${uuid}').listen('.NewLoginDetected', (data) {
//         log('listenNewLoginDetectedChannel : ' + data.toString());
//         mySocketContract.listenNewLoginDetected(data.toString());
//       });
//     } catch (e) {
//       log('listenListAuctionChannel exception : ' + e.toString());
//     }
//   }
//
//   // listenToUnreadNotificationCountChannel
//   Future<void> listenUnreadNotificationCount(String uuid) async {
//     try {
//       log('listenUnreadNotificationCountChannel..');
//       echo.channel('UnreadNotificationCount.${uuid}').listen('.UnreadNotificationCount', (Map<String, dynamic> data) {
//         log('listenUnreadNotificationCountChannel : ' + data.toString());
//         mySocketContract.listenUnreadNotificationCount(data);
//       });
//     } catch (e) {
//       log('listenUnreadNotificationCountChannel exception : ' + e.toString());
//     }
//   }
//
//   // listenToBroadcastCurrentTimeChannel
//   Future<void> listenToBroadcastCurrentTime() async {
//     try {
//       log('listenToBroadcastCurrentTimeChannel..');
//       echo.channel('BroadcastCurrentTime').listen('.BroadcastCurrentTime', (Map<String, dynamic> data) {
//         log('listenToBroadcastCurrentTimeChannel : ' + data.toString());
//         mySocketContract.listenToBroadcastCurrentTime(data);
//       });
//     } catch (e) {
//       log('listenBroadcastCurrentTimeChannel exception : ' + e.toString());
//     }
//   }
//
//   // listenToAuctionPriceUpdateChannel
//   Future<void> listenToAuctionPriceUpdate(String uuid) async {
//     try {
//       log('listenToAuctionPriceUpdateChannel..');
//       echo.channel('AuctionPriceUpdate.$uuid').listen('.AuctionPriceUpdate', (Map<String, dynamic> data) {
//         log('listenToAuctionPriceUpdateChannel : ' + data.toString());
//         mySocketContract.listenToAuctionPriceUpdate(data);
//       });
//     } catch (e) {
//       log('listenAuctionPriceUpdateChannel exception : ' + e.toString());
//     }
//   }
//
//   // listenToAuctionUpdateChannel
//   Future<void> listenToAuctionUpdate(String uuid) async {
//     try {
//       log('listenToAuctionUpdateChannel..');
//       echo.channel('AuctionUpdate.$uuid').listen('.AuctionUpdate', (Map<String, dynamic> data) {
//         log('listenToAuctionUpdateChannel : ' + data.toString());
//         mySocketContract.listenToAuctionUpdate(data);
//       });
//     } catch (e) {
//       log('listenAuctionUpdateChannel exception : ' + e.toString());
//     }
//   }
//
//   // listenToAuctionUpdateChannel
//   Future<void> listenToAuctionPrice(String uuid) async {
//     try {
//       log('listenToAuctionPriceChannel..');
//       echo.channel('AuctionPrice.$uuid').listen('.AuctionTablePrice', (Map<String, dynamic> data) {
//         log('listenToAuctionPriceChannel : ' + data.toString());
//         mySocketContract.listenToAuctionPrice(data);
//       });
//     } catch (e) {
//       log('listenToAuctionPriceChannel exception : ' + e.toString());
//     }
//   }
//
//   // listenToUserOrderUpdateChannel
//   Future<void> listenToUserOrderUpdate(String uuid) async {
//     try {
//       log('listenToUserOrderUpdateChannel..');
//       echo.channel('UserOrderUpdate.$uuid').listen('.UserOrderUpdate', (Map<String, dynamic> data) {
//         log('listenToUserOrderUpdateChannel : ' + data.toString());
//         mySocketContract.listenToUserOrderUpdate(data);
//       });
//     } catch (e) {
//       log('listenUserOrderUpdateChannel exception : ' + e.toString());
//     }
//   }
//
//   // listenToTopUpUpdateChannel
//   Future<void> listenToTopUpUpdate(String uuid) async {
//     try {
//       log('listenToTopUpUpdateChannel..');
//       echo.channel('TopupUpdate.$uuid').listen('.TopupUpdate', (Map<String, dynamic> data) {
//         log('listenToTopUpUpdateChannel : ' + data.toString());
//         mySocketContract.listenToTopUpUpdate(data);
//       });
//     } catch (e) {
//       log('listenToTopUpUpdateChannel exception : ' + e.toString());
//     }
//   }
// }
//
// abstract class MySocketContract {
//   void listenListAuction(String data);
//   void listenNewLoginDetected(String data);
//   void listenUnreadNotificationCount(Map<String, dynamic> data);
//   void listenToBroadcastCurrentTime(Map<String, dynamic> data);
//   void listenToAuctionPriceUpdate(Map<String, dynamic> data);
//   void listenToAuctionUpdate(Map<String, dynamic> data);
//   void listenToUserOrderUpdate(Map<String, dynamic> data);
//   void listenToAuctionPrice(Map<String, dynamic> data);
//   void listenToTopUpUpdate(Map<String, dynamic> data);
// }
