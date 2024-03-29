import 'package:flutter/material.dart';
import 'package:messenger_app/models/usuario.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class UsuariosPage extends StatefulWidget {

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {


  final usuarios = [
    Usuario(uid: '1', nombre: 'Maria', email: 'mariat@gmail.com',online: true),
    Usuario(uid: '2', nombre: 'Jim', email: 'jimh@gmail.com',online: true),
    Usuario(uid: '3', nombre: 'Rosario', email: 'rosada@gmail.com',online: true),
    Usuario(uid: '4', nombre: 'Lucio', email: 'lucioh@gmail.com',online: false),
    Usuario(uid: '5', nombre: 'Camila', email: 'camilah@gmail.com',online: false),
  ];

  RefreshController _refreshController = RefreshController(initialRefresh: false);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre', style: TextStyle(color: Colors.black87),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app, color: Colors.black87,)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            //Icon(Icons.check_circle, color: Colors.blue[400]),
            child: Icon(Icons.offline_bolt, color: Colors.red),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[400],),
          waterDropColor: Colors.blue[400]!,
        ),
        child: _listViewUsuarios(),
      )
   );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      itemBuilder: ( _ , i) => _usuarioListTile(usuarios[i]), 
      separatorBuilder: ( _ , i) => Divider(),
      itemCount: usuarios.length
    );
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email) ,
        leading: CircleAvatar(
          child: Text(usuario.nombre.substring(0,2)),
          backgroundColor: Colors.blue[100],
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: usuario.online ? Colors.blue[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }

  _cargarUsuarios () async {
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    
  }
}