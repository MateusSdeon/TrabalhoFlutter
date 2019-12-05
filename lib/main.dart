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
   String anos = "";

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
    if (_idadeDT == "3" || _idadeDT == "2"){
      anos = "Anos";
    }else if (_idadeDT == "1"){
      anos = "Ano";
    }else if(_idadeDT == "0.1"){
      anos = "Mês";
    }
    else{
      anos = "Meses";
    }
    _nome = ("Nome da Criança:\n ${controllerNome.text}");
    _sx = ("Sexo da Criança:\n ${_sexo}");
    _responsavel = ("Nome do Responsável:\n ${controllerResp.text}");
    _entrada = ("Hora de Entrada:\n ${controllerHora.text}");
    _id = ("Idade da criança:\n ${_idadeDT} ${anos}");
    _1p = "_____________________________________________________";
    _2p = "_____________________________________________________";
    _3p = "_____________________________________________________";
    _4p = "_____________________________________________________";
    
    


  });  
}
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
      body: Stack(
        children: <Widget>[
          Image.asset("imagens/carinhosos.jpg",
          fit: BoxFit.cover,
          height: 500.0,
          width: 600.0, 
          ),
        SingleChildScrollView( 
        //children: <Widget>[
          padding: EdgeInsets.all(00.0),
          child: Form(  
            key: _formKey,

            
              child: Column( 
              children: <Widget>[

                Text("          Bem vindo ao nosso Berçario!!! \n Por favor Preencha nosso formulario Digital", 
                style: TextStyle(fontSize:17.5,fontWeight: FontWeight.bold,),),
                Padding(padding: EdgeInsets.only(top: 25.0),),

                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (String){
                    if (String.isEmpty){
                      return "Informe o nome da criança";
                    }
                  },
                  controller: controllerNome,
                  style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold,color: Colors.black),                    

                  decoration: InputDecoration(
                    hintText: "Nome Completo",
                    labelText: "Nome Completo da Criança",
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black,),

                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0),),
                
                  RadioListTile(
                  
                  value: "Masculino",
                  title: Text("Masculino"),
                  groupValue: _sexo,
                  onChanged: (String value){
                    _abc(value);
                  },
                  activeColor: Colors.blue,
                ),

                  RadioListTile(
                  value: "Feminino",
                  title: Text("Feminino"),
                  groupValue: _sexo,
                  onChanged: (String value){
                    _abc(value);
                  },
                  activeColor: Colors.blue,
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
                  style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold,color: Colors.black),                    

                  decoration: InputDecoration(
                    hintText: "Nome do Responsável",
                    labelText: "Nome do Responsável",
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black,),
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
                  style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold,color: Colors.black),                    

                  decoration: InputDecoration(
                    hintText: "Hora da Entrada",
                    labelText: "Hora da Entrada",
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black,),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0),),

                Row(
                  children: <Widget>[
                    Text("Idade   ", style: TextStyle(fontSize:22.0,color:Colors.black, fontWeight: FontWeight.bold),),
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
                  style: TextStyle(color: Colors.black,fontSize: 22.0, fontWeight: FontWeight.bold,),
                ),
                Text(_1p,),

                Text(_sx,
                textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,fontSize: 22.0, fontWeight: FontWeight.bold,),
                ),
                
                Text(_2p,),

                Text(_responsavel,
                textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,fontSize: 22.0, fontWeight: FontWeight.bold,),
                ),
                Text(_3p,),

                Text(_entrada,
                textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,fontSize: 22.0, fontWeight: FontWeight.bold,),
                ),

                Text(_4p,),

                Text(_id,
                textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,fontSize: 22.0, fontWeight: FontWeight.bold,),
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
       ],
      )
    );
  } 
}