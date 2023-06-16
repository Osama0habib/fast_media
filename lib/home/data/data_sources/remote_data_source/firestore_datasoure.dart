import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_media/home/data/models/favorite_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseFireStoreDataSource {
  Future<void> addFavoriteMovie(FavoriteModel movie);
  Future<List<FavoriteModel>> getFavoriteMovies();
  Future<void> removeFromFavorite();
  Future<void> addToContinueWatching();

}

class FireStoreDataSource extends BaseFireStoreDataSource {
  final _db =FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser?.uid;
  @override
  Future<void> addFavoriteMovie(FavoriteModel movie) async {
    try{
       await _db.collection("Users").doc(userId).collection("favorite").add(movie.toDoc());
    }on FirebaseException catch(e){
      throw FirebaseException(plugin: e.plugin,message: e.message,code: e.code,stackTrace: e.stackTrace);
    }
  }

  @override
  Future<void> addToContinueWatching() {
    // TODO: implement addToContinueWatching
    throw UnimplementedError();
  }

  @override
  Future<List<FavoriteModel>> getFavoriteMovies() async {
    // TODO: implement addToContinueWatching
    throw UnimplementedError();
    // try {
    //   final response = await _db.collection("Users").doc(userId).collection("favorite").get(GetOptions());
    //   return ;
    // }on FirebaseException catch(e){
    //
    // }
  }

  @override
  Future<void> removeFromFavorite() {
    // TODO: implement removeFromFavorite
    throw UnimplementedError();
  }

}