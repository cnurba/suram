
import 'package:go_router/go_router.dart';
import 'package:suram/global/routes/app_router.dart';

import '../../auth/login/application/provider.dart';

final routerProvider = Provider<GoRouter>((ref) => AppRouter().router);
