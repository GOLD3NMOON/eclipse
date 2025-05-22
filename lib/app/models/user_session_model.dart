import 'dart:convert';

class UserSessionModel {
    final String userId;
    final String token;
    final String displayName;

    const UserSessionModel(
        {
            required this.token,
            required this.userId,
            required this.displayName
        }
    );


    factory UserSessionModel.fromJson(Map<String, dynamic> json) {
        return UserSessionModel(
            token: json['auth_user_token'],
            userId: json['auth_user_id'],
            displayName: json['auth_user_name']
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'auth_user_token': token,
            'auth_user_id': userId,
            'auth_user_name': displayName
        };
    }

    String toJsonString() => jsonEncode(toJson());

    static UserSessionModel fromJsonString(String source) => 
        UserSessionModel.fromJson(jsonDecode(source));

}
