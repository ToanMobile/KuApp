import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:googleapis_auth/auth_io.dart';
import 'package:intl/intl.dart';

import 'state.dart';

class LService {
  static final _CREDENTIALS = new ServiceAccountCredentials.fromJson(r'''
 {
  "type": "service_account",
  "project_id": "generated-motif-256213",
  "private_key_id": "1a16a90cc7674d7610e820e540abcf084ca4a938",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCWrROrtbdpH6aq\nnG2t/57YvaKJf2kXjJkWRRveNWH3h4oeMouKhUmg+YjFohwg/dDUS4qRqzO1Q++5\n4Hy2sYqDlytUyxT8bsCf0LsQAS9XcQj79eShU+RMb+8/x2K4hGpII3G5S8Dz9/hP\n0VGgyZO3nvSm/3aeKOI0GSrGgUoanwp1JFfDxhRYjhYHzfK/XiJqOaheLddWjukr\nWOv9cTlC80axuDn0pEaeaeEJ4k3msZ9lMAVn6NPU20uCGT+QV3XPMghJwfkA8TlE\n3dC3emT/NV4xsxQ0Wf8OPeyCQHVTGbeAXnCOEIaV8ml/nPv8urOiTJVzjrYJBC65\neawj+XcZAgMBAAECggEABtPrpn74NSppHpdrpH7cb20E6k1Dv6c3YZaFdMRRLQ5W\naF8Dw8JIP2sry+xxG6aBO52JmtkkjApB2PQ7QMFzu6EH0TKCsdTPaxk3p/LlzBNA\nizF8AQG7TrDARdDwh2aqfA3tWHWMjw/ec2MLhh6cUFh7por5dC+H3s8sQfDCy8kS\nD+emqTz7DzrxQMwbmOVB0nxBPyWsReNkrXNZaF5vIHP6JLKZK+wWvVn3svR8HdgY\nyd8ntTHrHi08xriglZkscrHmdXSa6yARump7w2jyH+rGwCn/U7P36+odHhJJlX96\naFVP1+OS/DEotpgeaw7LGmwNVO0KlLAWuwhuLxRMIQKBgQDIX1fHwZAd1TnmkCBW\nbMGzoleyXVseIdHlPifTSn3qVswNwY479N16iggql2BalT0m78EULKvP3opDkZ1p\ndZleybhmXNVj4wkCOiCwgEAJt/BDb5c30Rs8J/bqYKaNeNJ+gJk7ViLdVVzZDpx7\n5S/b2ArlzTbNo0EvyALItcUyXwKBgQDAgcR8xqqscB2C0XqVYN22N2H76p5mroWz\noPLmV9vAa+yI4AwjrBwUcQkVV8nTs6FCk2Xq9NWL4nC6g7+hsYoxRr9p+BO0equ5\nPcpPD6rSqRRBvHNouxQTcPG2t66ME2yzJ1UXk5UQ8cOm6dewA7URYgthj/6bZRJj\n0UczPPN5hwKBgEVHCa+MEgruhRVdcYDQG2zDTXTi6DUT1mFfSx+3mq9iES0UZdv+\n/nB2tvoa2nqXLMyAio4yH7lAJSfVecpTmZJ3RiVGJZVikuPNOy4rOXjiutRmCa+H\nwdXbr3g7sHorcwO/7LriPi2ubOqzLZF8nT5yhNoNSMxyjIA7tBK3HhYbAoGAKJg0\n0wsh2pMZ5gg+jVmL52zuYK0tEgIjd6mtDx3f3Ufk7UgxxyP4F+duPu3wRZBPpTZn\n+4/9qC3sD6jQtEw4FAQTQUlq/lgP9lQtYVawcxPsjaArxh4NMbxTfHBngmpmNbFJ\npFseyB/zXjNZpGhjunKua7htvF8n7ZyoIwnrXekCgYEAnBIOZcMlhu7r3+l7DHYi\nnNLcRl2lf8bdbuHyDaQMyepuOZmEf85jXlf0s0sSWRMKzPMdxF6dzflIEMQ2xU+n\nonaSHeRH7/7AYcvFwwVW98hnyp6yYqKDcB3f/40ISVlBLzfCYFrzpqxm9Wpdeh28\nMroi+gzxFsM+WqB9C9p6wxQ=\n-----END PRIVATE KEY-----\n",
  "client_email": "KUCasino.ldt-154@generated-motif-256213.iam.gserviceaccount.com",
  "client_id": "109674441469237573007",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/KUCasino.ldt-154%40generated-motif-256213.iam.gserviceaccount.com"
}
''');

  static final google_api_key =
      "705447754849-44rctjrj3bn7k0pqf1emlah1vdmg4j5c.apps.googleusercontent.com";
  static final SPREADSHEET_ID = "1uF7hijPwobrH2EuBTQGx1tYC8SS_L8HM15t28S_biqg";
  static final _SCOPES = const ['https://www.googleapis.com/auth/spreadsheets'];
  static final RANGE_SIGN_UP = 'KUCasino.ldt!A1:D1';
  static final RANGE_ORDER = 'orders!A1:Q30';
  static final RANGE_MENU = 'menu!A1:Q30';

  static Future<bool> saveSignUp(String name, String sdt, String tk) async {
    var client = await clientViaServiceAccount(_CREDENTIALS, _SCOPES);
    var api = sheets.SheetsApi(client);
    var isPush = false;
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
    await api.spreadsheets.values
        .append(range, SPREADSHEET_ID, range.range,
            valueInputOption: 'USER_ENTERED')
        .then((data) {
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
