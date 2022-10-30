// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidy/app/modules/digimon/cubit/digimon_cubit.dart';
import 'package:flutter_slidy/app/modules/digimon/repositories/digimon_repository.dart';

class DigimonPage extends StatefulWidget {
  final DigimonRepository digimonRepository;

  const DigimonPage({
    Key? key,
    required this.digimonRepository,
  }) : super(key: key);
  @override
  DigimonPageState createState() => DigimonPageState();
}

class DigimonPageState extends State<DigimonPage> {
  @override
  Widget build(BuildContext context) {
    // var _digimonRepository = widget.digimonRepository;
    // var digimonList = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digimons'),
      ),
      body: BlocBuilder<DigimonCubit, DigimonGetState>(
        builder: (context, state) {
          if (state is DigimonGetLoading) {
            return const CircularProgressIndicator();
          } else if (state is DigimonGetError) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is DigimonGetLoaded) {
            final digimonList = state.digimonList;
            return digimonList.isEmpty
                ? const Text('No data found')
                : ListView.builder(
                    itemCount: digimonList.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(digimonList[index].name.toString()),
                    ),
                  );
          }
          return const Center(child: Text('Unknown Error'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}


// FutureBuilder<List<DigimonModel>>(
//         future: _digimonRepository.getDigimon(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                       width: 150,
//                       height: 150,
//                       child:
//                           Image.network(snapshot.data![index].img.toString())),
//                 );
//                 // ListTile(
//                 //   title: Text(snapshot.data![index].name.toString()),
//                 // );
//               },
//             );
//           }
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),