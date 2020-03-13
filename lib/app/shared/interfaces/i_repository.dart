import 'package:hasura_connect/hasura_connect.dart';
import 'package:hello_wold_hasura/app/shared/const/endpont.dart';
import 'package:hello_wold_hasura/app/shared/const/queries.dart';


class IRepository extends Queries {
  HasuraConnect hasuraConnect;

  IRepository()
      : hasuraConnect = HasuraConnect(
          Endpoint.baseUrl,
          /// TODO habilitar chave secreta 
         /// headers: {'x-hasura-admin-secret': ''}
        );
}
