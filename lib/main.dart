import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Formulario Infantil",
    home: Home()
  ,));
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> idadeDT=["0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3", ];
  String _idadeDT = null;
  String _sexo= "";

   TextEditingController controllerNome = TextEditingController();
   TextEditingController controllerResp = TextEditingController();
   TextEditingController controllerHora = TextEditingController();

   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   String _nome = "";
   String _sx = "";
   String _responsavel = "";
   String _entrada = "";
   String _id = "";
   String _1p = "";
   String _2p = "";
   String _3p = "";
   String _4p = "";

void _abc(String value){
  setState((){
    _sexo = value;
  });


}

void caixa (String value){
  setState((){
    _idadeDT = value;
  });

}

void _apagarTudo(){
  setState((){
    controllerNome.text="";
    controllerResp.text="";
    controllerHora.text="";
    _sexo = null;
    _idadeDT = null;
    _nome="";
    _sx="";
    _responsavel="";
    _entrada="";
    _id = "";
    _1p = "";
    _2p = "";
    _3p = "";
    _4p = "";
    
  });
}

void mostrarTela(){
  setState((){
    _nome = ("Nome da Criança: ${controllerNome.text}");
    _sx = ("Sexo da Criança: ${_sexo}");
    _responsavel = ("Nome do Responsável: ${controllerResp.text}");
    _entrada = ("Hora de Entrada: ${controllerHora.text}");
    _id = ("Idade da criaça: ${_idadeDT} anos");
    _1p = "...";
    _2p = "...";
    _3p = "...";
    _4p = "...";
    
    


  });
  // AlertDialog alertDialog = AlertDialog(
  //   content: Container(
  //     height: 200.0,
  //     child: Column(
  //       children: <Widget>[
  //         Text("Nome : ${controllerNome.text}"),
  //         Text("Sexo da Criança : ${_sexo}"),
  //         Text("Responsavel : ${controllerResp.text}"),
  //         Text("Hora da Entrada : ${controllerHora.text}"),
  //         Text("Idade : ${_idadeDT} anos"),
  //         RaisedButton(
  //           child: Text("Voltar"),
  //           onPressed: ()=> Navigator.pop(context),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
  // showDialog(context: context, child: alertDialog);
  
}
  //GlobalKey<FormState>_key = GlobalKey();
  //bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         //leading: Icon(Icons.list),
         title: Text("Berçario"),
         centerTitle: true,
         backgroundColor: Colors.blue,
         actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh),
              onPressed: _apagarTudo,
            )
          ],
       ),
       backgroundColor: Colors.white,
        //singleChild
      body: 
      SingleChildScrollView( 
        //children: <Widget>[
            padding: EdgeInsets.all(10.0),
          child: Form(  
            key: _formKey,

            
              child: Column( 
              children: <Widget>[

                Text("          Bem vindo ao nosso Berçario!!! \n Por favor Preencha nosso formulario Digital", 
                style: TextStyle(fontSize:17.0),),
                Padding(padding: EdgeInsets.only(top: 20.0),),

                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (String){
                    if (String.isEmpty){
                      return "Informe o nome da criança";
                    }
                  },
                  controller: controllerNome,
                  decoration: InputDecoration(
                    
                    hintText: "Nome Completo",
                    labelText: "Nome Completo da Criança",
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0),),

                  RadioListTile(
                  // validator : (value){
                  //   if (value == null){
                  //     return "Informe seu sexo";
                  //   }
                  // },
                  value: "Masculino",
                  title: Text("Masculino"),
                  groupValue: _sexo,
                  onChanged: (String value){
                    _abc(value);
                  },
                  activeColor: Colors.red,
                ),

                  RadioListTile(
                  value: "Feminino",
                  title: Text("Feminino"),
                  groupValue: _sexo,
                  onChanged: (String value){
                    _abc(value);
                  },
                  activeColor: Colors.red,
                ),

                Padding(padding: EdgeInsets.only(top: 20.0),),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (String){
                    if (String.isEmpty){
                      return "Informe o Nome do responsável";
                    }
                  },
                  controller: controllerResp,
                  decoration: InputDecoration(
                    hintText: "Nome do Responsável",
                    labelText: "Nome do Responsável",
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))
                ),
              ),
              
                Padding(padding: EdgeInsets.only(top: 20.0),),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  validator: (String){
                    if (String.isEmpty){
                      return "Informe a hora da entrada";
                    }
                  },
                  controller : controllerHora,
                  decoration: InputDecoration(
                    hintText: "Hora da Entrada",
                    labelText: "Hora da Entrada",
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0),),

                Row(
                  children: <Widget>[
                    Text("Idade   ", style: TextStyle(fontSize:20.0,color:Colors.black),),
                  DropdownButton(
                    
                  onChanged: (String value){
                    caixa(value);
                  },
                  value: _idadeDT,
                  items: idadeDT.map((String value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                  ],
                ),
                

                RaisedButton(
                  child: Text("Validar"),
                  color: Colors.red,
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                    mostrarTela();
                    }
                  },
                ),

              Text(
                 _nome ,
                 textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,fontSize: 20.0),
                ),
                Text(_1p,),

                Text(_sx,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
                ),
                
                Text(_2p,),

                Text(_responsavel,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
                ),
                Text(_3p,),

                Text(_entrada,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
                ),

                Text(_4p,),

                Text(_id,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
                ),
              // Text("Sexo da Criança : ${_sexo}"),
              // Text("Responsavel : ${controllerResp.text}"),
              // Text("Hora da Entrada : ${controllerHora.text}"),
              // Text("Idade : ${_idadeDT} anos"),
                
              ],
          ),
          ),

        //],
      ),
    );
  } 
}