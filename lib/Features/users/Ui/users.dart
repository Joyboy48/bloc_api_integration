import 'package:bloc_api_integration/Features/users/bloc/users_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final UsersBloc usersBloc = UsersBloc();
  @override
  void initState() {
    usersBloc.add(UsersInitialFetchEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Page'),
      ),
      body: BlocConsumer<UsersBloc, UsersState>(
        bloc: usersBloc,
        listenWhen: (previous,current)=> current is UsersActionState,
        buildWhen: (previous,current)=> current is !UsersActionState,
        listener: (context, state) {

        },
        builder: (context, state) {
          switch (state.runtimeType){
            case UsersFetchingLoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case UsersFetchingSuccessState:
              final successState = state as UsersFetchingSuccessState;
              return Container(
                child: ListView.builder(itemCount: successState.users.length,
                    itemBuilder: (context,index){
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        color: Colors.grey.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(successState.users[index].id.toString()),
                            SizedBox(height: 10,),
                            Text(successState.users[index].name.toString()),
                            SizedBox(height: 10,),
                            Text(successState.users[index].username.toString()),
                            SizedBox(height: 10,),
                            Text(successState.users[index].email.toString()),
                            SizedBox(height: 10,),
                            //address
                            Text('Address'),
                            Text(successState.users[index].address.street.toString()),
                            SizedBox(height: 5,),
                            Text(successState.users[index].address.suite.toString()),
                            SizedBox(height: 5,),
                            Text(successState.users[index].address.city.toString()),
                            SizedBox(height: 5,),
                            Text(successState.users[index].address.zipcode.toString()),
                            SizedBox(height: 10,),
                            Text("geo"),
                            Text(successState.users[index].address.geo.lat.toString()),
                            SizedBox(height: 5,),
                            Text(successState.users[index].address.geo.lng.toString()),
                            SizedBox(height: 10,),
                            ///======
                            Text(successState.users[index].phone.toString()),
                            SizedBox(height: 10,),
                            Text(successState.users[index].website.toString()),
                            SizedBox(height: 10,),
                            Text('Company'),
                            Text(successState.users[index].company.name.toString()),
                            SizedBox(height: 5,),
                            Text(successState.users[index].company.catchPhrase.toString()),
                            SizedBox(height: 5,),
                            Text(successState.users[index].company.bs.toString()),

                          ],
                        ),
                      );
                    }),

              );
            default:
              return SizedBox();
          }

        },
      ),
    );
  }
}
