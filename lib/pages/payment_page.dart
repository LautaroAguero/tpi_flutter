import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  String _comprobante = '';
  String _monto = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.background.withOpacity(0.1),
      body: Center(
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: SizedBox(
            width: 600,
            height: 630,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.payment,
                            size: 50,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Nuevo Pago',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Selecciona Metodo de pago',
                              style: Theme.of(context).textTheme.bodyMedium),
                          SizedBox(width: 10),
                          DropdownMenu()
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'N° de Comprobante'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Monto'),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Adjuntar Comprobante',
                          style: Theme.of(context).textTheme.bodyMedium),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(0.6),
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.2),
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.picture_as_pdf,
                          size: 50,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: FittedBox(
                            child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.error,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  size: 40,
                                  Icons.warning,
                                  color: Colors.redAccent,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Los pagos en efectivo se realizan en la tesoreria de la facultad',
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                              ],
                            ),
                          ),
                        )),
                      ),
                      SizedBox(height: 35),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 20),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary, // set the background color here
                          foregroundColor:
                              Colors.white, // set the text color here
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _submitForm(context);
                          } else {
                            _showIncompleteFieldsDialog(context);
                          }
                        },
                        child: Text('Enviar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _submitForm(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Cargado correctamente'),
      backgroundColor: Colors.green,
    ));
  }

  String? _validateComprobante(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese el número de comprobante';
    }
    return null;
  }

  String? _validateMonto(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese el monto';
    }
    return null;
  }

  void _showIncompleteFieldsDialog(BuildContext context) {
    List<String> incompleteFields = [];
    if (_comprobante.isEmpty) {
      incompleteFields.add('Número de Comprobante');
    }
    if (_monto.isEmpty) {
      incompleteFields.add('Monto');
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Campos incompletos'),
          content: Text(
              'Por favor complete los siguientes campos:\n\n${incompleteFields.join('\n')}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class DropdownMenu extends StatefulWidget {
  const DropdownMenu({super.key});

  @override
  State<DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  // Initial Selected Value
  String dropdownvalue = 'Debito/Credito';

  // List of items in our dropdown menu
  var items = [
    'Debito/Credito',
    'Plataforma Digital',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}
