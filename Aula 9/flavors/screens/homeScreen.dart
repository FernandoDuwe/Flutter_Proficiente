import "package:flavors_store/classes/appFlavor.dart";
import "package:flavors_store/widgets/candyDrawer.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: (Provider.of<AppFlavor>(context).pedidosOnline
          ? CandyDrawer()
          : null),
      floatingActionButton: (Provider.of<AppFlavor>(context).enviarEmail
          ? FloatingActionButton(
              child: Icon(Icons.send),
              onPressed: () {
                print("Estou enviando e-mails");
              },
            )
          : null),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Provider.of<AppFlavor>(context).title,
              style: TextStyle(fontSize: 28),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Provider.of<AppFlavor>(context).homeIcon,
            ),
            Text(Provider.of<AppFlavor>(context).welcomeText)
          ],
        ),
      ),
    );
  }
}
