import 'dart:async';

import 'package:angel_framework/http.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:logging/logging.dart';
import 'package:args/args.dart';

import 'package:angel_container/mirrors.dart';
import 'package:graphql_starwars_test_server/src/pretty_logging.dart'
    show prettyLog;
import 'package:graphql_starwars_test_server/graphql_starwars_test_server.dart'
    as star_wars;

bool parseBool(dynamic arg) {
  final b = (arg as String).toLowerCase();
  return b.startsWith('t') || b.startsWith('1');
}

final parser = ArgParser()
  ..addOption('host', defaultsTo: '127.0.0.1')
  ..addOption('port', defaultsTo: '3000')
  ..addOption('enableCors', defaultsTo: 'true')
  ..addOption('generateReviews', defaultsTo: 'true');

void main(List<String> args) async {
  final arguments = parser.parse(args);
  final host = arguments['host'] as String;
  final port = int.parse(arguments['port'] as String);

  final enableCors = parseBool(arguments['enableCors']);

  final generateReviews = parseBool(arguments['generateReviews']);

  print(
    "CORS: ${enableCors ? 'enabled' : 'disabled'}\n"
    "Review Generation: ${generateReviews ? 'enabled' : 'disabled'}",
  );

  Future<Angel> createServer() async {
    Angel app = Angel(reflector: MirrorsReflector());
    app.logger = Logger('star_wars')..onRecord.listen(prettyLog);
    await app.configure(
      star_wars.serverConfigurer(
        enableCors: enableCors,
        generateReviews: generateReviews,
      ),
    );
    return app;
  }

  hierarchicalLoggingEnabled = true;

  final server = await AngelHttp(await createServer()).startServer(host, port);

  final serverUrl = Uri(
    scheme: 'http',
    host: server.address.address,
    port: server.port,
  );
  final graphiQLUrl = serverUrl.replace(path: '/graphiql');
  print('Listening at $serverUrl');
  print('GraphiQL endpoint: $graphiQLUrl');
}
