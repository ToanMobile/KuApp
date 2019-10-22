import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:googleapis_auth/auth_io.dart';
import 'package:intl/intl.dart';

import 'state.dart';

class LService {
  static final _CREDENTIALS = new ServiceAccountCredentials.fromJson(r'''
{
  "access_type": "offline",
  "type": "service_account",
  "project_id": "generated-motif-256213",
  "private_key_id": "d464cfb5e110bdf93f5457733a1b03026eb5092e",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC0rx8sdqmOAJ1e\nJTHqOfqdDMAzKFrLbRTBosmztLX0nfzIhgNRAkPbYqkPt81wQ5lavl/EkEE4SIhz\n6Xvof5unf8VQW7nUpuWBjv3pa20qzS6vDZDM+q7TVn8uXsg2zFTKef9jf2sxsRSF\nge//l62XAiNh9DbHj7TfBv/VQ5fycJgySjk7mozQkkX5cRRK8K0USfNzvzRWRt/v\nyYPHGczieNEyqyVvN4oo/xKHzLnkRozvhYMnlL8BeXxc2SOP5cd11LSlS5k/9XiR\nIfSQqfg4F1PEB8XaCaSd3p0O1iG4ytfr+IAMNRdLTrb7lyUOH9JiBBq/BE+pi1n7\nK2FeKb8hAgMBAAECggEACbq4WgOVw8DCuJQWKP+wQA60tsyAfx3DlV23sMaVWbO8\nLewRd6ZAkyqv4dnK5TWup1VDAOmnqWk2d89lzbI5Zn6Z2GboDcxi5WQWxh/zw+9C\niUiYuIDzMwwgUxXlgBXmpvSEzQ3KbuWTLlE95Cx9u3jxANBOttZFLhFJa2l1YCea\n0JurSM16N1JxQxc/O4l5tT4H+pIxhjQrCoLe1uRRdkunn+CeOTHSLMWtVNVCcMOq\nxzL9gjqj1amX6GwX5mLufnkdEYP+36GD01g2b5faondG7LWY8GV9ioWPa9ykRWf0\nAyrWL6c+WOXN6RDgwJSmAI+Z+Uy8WzNz2iQPUGw7sQKBgQDZNeDg7t0uL9qoPbJm\nXp6vUjdjnQ4S8xKWYXH/majTixgrrZ2sjSVx7uqaty0Cm6e2DzbeVJICC7YSY3z/\nxC/uMcGLQAh7bloEBxNkcH79dRbZNhPhWCOLi3BV1BDPQYa7QXh3eLki6cU7GkP9\nAx1q53Mpkj0CR0tJkXaGPBTWNQKBgQDU82GXO1jTSiCKsFGgJ+X1b68XTZNPD15F\nccRNt0JgYPHO+ZwVAbIYVDSrSFj3xYeWLbnhvlNT0zPP93lHO99HWuGmHy6hp4E8\nChcji2+o++GMLuKUo6wRq/6RaMH5vmnNqMUj44oHFie2JAGPYb2FD4XzEXOKnRhz\n0x236lRyvQKBgQCl0mwLTE+uovna1r8LR9D9J1cBxTSpYsgd5eaRq00nsliRf8mP\noXGkuTCBTLYf95TheFv6/7U3upkVEL6sw6mTvohzNj9De8tcp8o2M2u/M1RuHsqu\njgsUzS7FV1A96VhiPGkrTA6KiMz5gePFlEsxAeD5K5tH0gW39ET31YZSwQKBgHI+\nK7HtdcbMss6UrwXDwdu9UeqnhIrajNGmqhCjaym3eKJ4SOMAKOJicmsdghVS1F2e\nJGXWLHABE3/TnS25Ehz+xaXQfrzc1zk1lJpOGNZIYwVItefWMt68LfMmh0ILhEl/\n7FtHm+oXWbCeenPIlNsIq+zuBNVtWAvzS7M6NJnlAoGAaYH4eKyWuYemLeqA8nJx\ncrdPCcFiwcGbY3eIb1B8R07BFZKIFH3zW79sSqrOE3EMVhw8jWitZPiWSR51uKyo\nFC+x8hpFlnBhQt2P4b1FMgwHfHC1/zl+cSnkP/CEeUHPOZWpk8SFqhP/M4cwsO1g\nouoiT9C/2SaxKZUDgQptTW4=\n-----END PRIVATE KEY-----\n",
  "client_email": "kuapp-154@generated-motif-256213.iam.gserviceaccount.com",
  "client_id": "109674441469237573007",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/kuapp-154%40generated-motif-256213.iam.gserviceaccount.com"
}

''');

  static final google_api_key =
      "705447754849-44rctjrj3bn7k0pqf1emlah1vdmg4j5c.apps.googleusercontent.com";
  static final SPREADSHEET_ID = "1uF7hijPwobrH2EuBTQGx1tYC8SS_L8HM15t28S_biqg";
  static final _SCOPES = const ['https://www.googleapis.com/auth/spreadsheets'];
  static final RANGE_SIGN_UP = 'KuApp!A2:D2';
  static final RANGE_ORDER = 'orders!A1:Q30';
  static final RANGE_MENU = 'menu!A1:Q30';

  static Future<bool> saveSignUp(String name, String sdt, String tk) async {
    var client = await clientViaServiceAccount(_CREDENTIALS, _SCOPES);
    var api = sheets.SheetsApi(client);
    sheets.ValueRange range = sheets.ValueRange();
    List<String> listData = new List();
    var time = DateFormat("dd-MM-yyyy hh:mm a").format(DateTime.now());
    print(time.toString());
    listData.add(time.toString());
    listData.add(name);
    listData.add(sdt);
    listData.add(tk);
    List<List<String>> valueRange = new List();
    valueRange.add(listData);
    range.values = valueRange;
    range.range = RANGE_SIGN_UP;
    print('valueRange=' + valueRange.toString());
    print('range=' + range.range);
    var isPush = false;
    await api.spreadsheets.values
        .append(range, SPREADSHEET_ID, range.range,
            valueInputOption: 'USER_ENTERED')
        .then((data) {
      print('data=' + data.toString());
      if (data != null)
        isPush = true;
      else
        isPush = false;
    }).catchError((onError) {
      print(onError);
      isPush = false;
    });
    LState.reset();
    return isPush;
  }

  static Future<List<String>> getData() async {
    sheets.ValueRange result;
    List<String> listData = List();
    var client = await clientViaServiceAccount(_CREDENTIALS, _SCOPES);
    var api = sheets.SheetsApi(client);
    await api.spreadsheets.values.get(SPREADSHEET_ID, RANGE_SIGN_UP).then((_) {
      result = _;
    }).whenComplete(() {
      for (int i = 0; i < result.values.length; i++) {
        //print('values='+ result.values[i].toString());
        for (String data in result.values[i]) {
          listData.add(data);
        }
      }
    });
    //print('orders='+ listData.toString());
    return listData;
  }

  static Future<List<String>> getUsers() async {
    List<String> userList = new List();

    sheets.ValueRange result;
    var api;
    await clientViaServiceAccount(_CREDENTIALS, _SCOPES).then((http_client) {
      api = new sheets.SheetsApi(http_client);
    });

    await api.spreadsheets.values.get(SPREADSHEET_ID, RANGE_SIGN_UP).then((_) {
      result = _;
    }).whenComplete(() {
      for (List<Object> o in result.values) {
        userList.add(o[0]);
      }
    });
    print(userList);
    return userList;
  }

  static Future<List<String>> getOrdersOfCurrentUser() async {
    List<String> orders = new List();
    String currentUser = LState.currentUser;

    sheets.ValueRange result;
    var api;
    await clientViaServiceAccount(_CREDENTIALS, _SCOPES).then((http_client) {
      api = new sheets.SheetsApi(http_client);
    });

    await api.spreadsheets.values.get(SPREADSHEET_ID, RANGE_ORDER).then((_) {
      result = _;
    }).whenComplete(() {
      for (int j = 0; j < result.values.length; j++) {
        List<Object> row = result.values[j];
        if (row[0] == currentUser) {
          LState.setUserRow(j + 1);
          for (int i = 1; i < row.length; i++) {
            orders.add(""); //new Order(result.values[0][i], row[i]));
            LState.setDateToColumn(result.values[0][i], i);
          }
        }
      }
    });

    return orders;
  }

  static Future<Map<String, List<String>>> getMenu() async {
    sheets.ValueRange result;
    Map<String, List<String>> orders = new Map();
    var api;
    await clientViaServiceAccount(_CREDENTIALS, _SCOPES).then((http_client) {
      api = new sheets.SheetsApi(http_client);
    });

    await api.spreadsheets.values.get(SPREADSHEET_ID, RANGE_MENU).then((_) {
      result = _;
    }).whenComplete(() {
      for (String date in result.values[0]) {
        orders.putIfAbsent(date, () => new List());
      }

      for (int i = 2; i < result.values.length; i++) {
        for (int j = 0; j < result.values[i].length; j++) {
          if (result.values[i][j] != '') {
            orders[result.values[0][j]].add(result.values[i][j]);
          }
        }
      }

      for (String key in orders.keys) {
        orders[key].add('');
      }
    });
    //print(orders);
    return orders;
  }

  static saveOrder() async {
    var api;
    await clientViaServiceAccount(_CREDENTIALS, _SCOPES).then((http_client) {
      api = new sheets.SheetsApi(http_client);
    });

    sheets.ValueRange range = new sheets.ValueRange();
    range.range = 'orders!B' +
        LState.userRow.toString() +
        ':' +
        String.fromCharCode(LState.orders.keys.length + 65) +
        LState.userRow.toString();
    print(range.range);
    List<String> order = new List();
    for (int i = 1; i <= LState.orders.keys.length; i++) {
      for (String key in LState.dateToColumn.keys) {
        if (LState.dateToColumn[key] == i) {
          order.add(LState.orders[key]);
        }
      }
    }
    List<List<String>> valueRange = new List();
    valueRange.add(order);
    range.values = valueRange;
    //print(valueRange);
    //print(range);
    api.spreadsheets.values.update(range, SPREADSHEET_ID, range.range,
        valueInputOption: 'USER_ENTERED');

    LState.reset();
  }
}
