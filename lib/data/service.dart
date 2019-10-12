import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:googleapis_auth/auth_io.dart';
import 'state.dart';

class LService {
  static final _CREDENTIALS = new ServiceAccountCredentials.fromJson(r'''
  {
   "type": "service_account",
    "project_id": "kuapp-255709",
    "private_key_id": "dbaec09cd3dd67ffcacab3106f52c3ea4720183b",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQChYvyVhfOpZPcV\nFLawIQpb26L9cDjdEgTRs2qYmEONflT/tUMLzIJgj2Ig7ztiOpu2imu+G1rPWOnZ\ndodm6D57vRJnHQgvzSeWLLYGJavxwZVOBH6joB9gh6G4gAJrLnL0rc1I4VKDxZ26\nm5rsJMz1t+zjn4SROuvEYHY90WGbndHkOjp2uRIvMPyw7LTcDsJZjrjs2qhI6+2u\nP7dl5BLIq8XjcixYaAvBq3a2p0nM/9CjqZo/6Euy63IWtxEjAIposnwmIAu9LoVN\nONl3+DU9RwKeulOrCO49lNcW04UvErQA2doBmdfguavJqhnjnXRHuIKvF8Z5b4x/\nOS14QH2ZAgMBAAECggEACdHv7doLwvTA0CIr7gWxdd6kfII10F95tmTeowOVpxtw\nnDdxKY7VJ0wyO8mZNgq8HnX69/aXWclepi8L+1s9MHxUJvAUtAvqUVbN8KVqlAUk\nF6Fp/BZ3Mk5IE39YJlUNa6c6Hlz19cyyVbOFA496ftnyBFu/GxmYIdSyY5denObI\nHFPq9Pk2zngmZwWx6Q3PWwdFzd5mLh5pEzXv8HDcysWn8aLFjzxXOpPAwdnsaoq9\nQ4qvtn6NLp0jPuoTRadHyihwV9wwoQtKKYveqGp8gfLfKMeqcgkjCMty0Tsz3Y6m\nrKq26MMe8TW7BJYoahk3qtjVjjHgixc39pd/WdRvvQKBgQDaq2SoTBRdsKEwU1Ii\nxgfDqOTERZGln0MRHXi2JP9zyD6GNG4YRIFhSD6Ky8MFtSrUV9QU8gF8+S/Z+S46\nDc6UnWMV0/OHzB6sDaBVUSYS18dkfOoicUbgguVHdtibd6++ZKk2tKRjQ7VraOiP\nQ9oEzAUy/eR+ewp0IVn4djghgwKBgQC88CMZ6L3o3CYtw+mtUjjwSDcr53SBnyHR\n1+5ixK/ZnDbKWoBMLzQYQSB+hxMpwXqIhTPfSEloSLpH4U+kgEbcCU8CDbuM/ba0\nt/yLu+zyiu0NQG7bY6qKZuEX/1KL/jm+YZ5TCcG4R7itq5JEhMYBaLEkLayDNcKC\nat/DSIiFswKBgCZXNO/5XvzKcojJozYrqMLawznSxOXYVecTVs4BELVZX/UiDke9\nAz5ub2Dgt1Ix4M+YkrwVbsNd4dEDSuKs9xLBwdTa8/FUjfA292zeLKHTKcfpyxe8\n6uOEr/Tm1rXzt2HXvn+0DrrE7XNm0pgEGp8KssKtF7pBkqSoEGFrQQ5HAoGANpgI\n/H6VCYk7evPmPM/KZhvn3UbXEnFh+1myp1WAHpgV+Oins9vb6LpA4m6zadhfSL18\nnKMtmvWQ5h5DvhvW3dPOwaAoNnhFZ/jV/6aAtCDSmIaqwbgN2koZ9q4vMwZ1tv5M\nGmByWoZW5c/yxtu6v0N6FCMiexN4reil2a7GzCMCgYEA2Wi7dpB6WD+qRkJiYSD1\nMZN4uj2lIdbi53/aFSqTz04KyzqJhgKh2y3ylLELP+VN/NQRH/zhDaxPcGQVVIX4\nKFHEmouFkRYs0kyoyxrS6Y7SMBUALoB4Zbtn3olQSgheA0Xe9X0nhz54NmAkGiHS\nW85lDw64F/LYrsn61udSlQ0=\n-----END PRIVATE KEY-----\n",
    "client_email": "kuapp-741@kuapp-255709.iam.gserviceaccount.com",
    "client_id": "112692595518088842190",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/kuapp-741%40kuapp-255709.iam.gserviceaccount.com"
}

''');

  static final google_api_key =
      "705447754849-44rctjrj3bn7k0pqf1emlah1vdmg4j5c.apps.googleusercontent.com";
  static final SPREADSHEET_ID = "1mjpM60dCmvO93rVL920fAVIMpX-k1Eo6aFna7NrkaCg";
  static final _SCOPES = const ['https://www.googleapis.com/auth/spreadsheets'];
  static final RANGE_SIGN_UP = 'KuApp!A1:C1';
  static final RANGE_ORDER = 'orders!A1:Q30';
  static final RANGE_MENU = 'menu!A1:Q30';

  static Future<bool> saveSignUp() async {
    var client = await clientViaServiceAccount(_CREDENTIALS, _SCOPES);
    var api = sheets.SheetsApi(client);
    sheets.ValueRange range = new sheets.ValueRange();
    range.range = 'A1' + ':' + 'A3';
    print(range.range);
    List<String> list = new List();
    for (int i = 1; i <= 3; i++) {
      list.add(i.toString());
    }
    List<List<String>> valueRange = new List();
    valueRange.add(list);
    range.values = valueRange;
    print('valueRange=' + valueRange.single.toString());
    print('range=' + range.toString());
    api.spreadsheets.values.update(range, SPREADSHEET_ID, range.range,
        valueInputOption: 'USER_ENTERED');
    LState.reset();
    return false;
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
        print('values='+ result.values[i].toString());
        for(String data in result.values[i]){
          listData.add(data);
        }
      }
    });
    print('orders='+ listData.toString());
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
