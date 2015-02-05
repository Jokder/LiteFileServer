part of server;

class Configuration{
  Object getConfig(){
    var confFile=new File("conf.json");
    var confString=confFile.readAsStringSync();
    var confJson=JSON.decode(confString);
    return confJson;
  }

  static var confJson = new Configuration().getConfig();

  static int PORT = confJson['port'];
  static String ROOT = confJson['root'];
}