import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/domain/auth/authentication_service.dart';
import 'package:app/domain/auth/firebase_auth_service.dart';
import 'package:app/domain/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IoC {

  Map<String, Service> _services;
  Map<String, Bloc> _blocs;



  AuthenticationService _authenticationService;
  AuthenticationBloc _authenticationBloc;

  IoC(){
    _authenticationService = FirebaseAuthService();
    _authenticationBloc = AuthenticationBloc(authenticationService: _authenticationService);


    _services =  {
      "auth": _authenticationService,
    };

    _blocs = {
      "auth": _authenticationBloc
    };

  }

  Bloc getBloc(String blocName){
    Bloc bloc = _blocs["$blocName"];
    if (bloc == null) {
      throw Exception("Bloc specified was not found");
    }

    return bloc;
  }
}