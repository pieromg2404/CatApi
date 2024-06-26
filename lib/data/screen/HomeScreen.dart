// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/bloc/Cat_Bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CatBloc>(context).add(FetchCats(breedId: ""));
  }

  TextEditingController text_busqueda = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 120,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('CatBreeds'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      controller: text_busqueda,
                      decoration: const InputDecoration(
                        labelText: 'Search by Breed ID',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<CatBloc>(context)
                            .add(FetchCats(breedId: text_busqueda.text));
                      },
                      child: const Text("Search"))
                ],
              ),
            ],
          )),
      body: BlocBuilder<CatBloc, CatState>(
        builder: (context, state) {
          if (state.load) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.catbreed.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: state.catbreed.length,
              itemBuilder: (context, index) {
                final cat = state.catbreed[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(cat.name.toUpperCase()),
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/homedetail',
                                    arguments: cat,
                                  );
                                },
                                child: const Text(
                                  "MAS...",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          cat.imageUrl,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cat.origin.toUpperCase()),
                                Text(
                                  cat.alt_names.toUpperCase(),
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else if (state.error) {
            return Center(child: Text('Failed to load cats: ${state.message}'));
          } else {
            return const Center(child: Text('SIN DATOS'));
          }
        },
      ),
    );
  }
}
