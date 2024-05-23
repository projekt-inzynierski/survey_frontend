import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/domain/usecases/token_provider.dart';

class TokenProviderImpl implements TokenProvider{
  final GetStorage _storage;
  
  TokenProviderImpl(this._storage);

  @override
  String? getToken() {
    return _storage.read<String>('apiToken');
  }

}